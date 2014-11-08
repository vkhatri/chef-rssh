#
# Cookbook Name:: rssh
# Provider:: user
#
# Copyright 2014, Dan Fruehauf
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def whyrun_supported?
  true
end

action :add do
  new_resource.updated_by_last_action(write_conf)
end

action :remove do
  new_resource.updated_by_last_action(write_conf)
end

protected

#
# Walk collection for :add rssh_user resources
# Build and write the config template
#
def write_conf
  t = template(new_resource.config_path) do
    source 'rssh.conf.erb'
    cookbook 'rssh'
    owner 'root'
    group 'root'
    mode '0644'
    variables(:options => node['rssh']['options'],
              :allow => node['rssh']['allow'],
              :users => rssh_users
             )
  end
  t.updated?
end

# The list of rssh user resources in the resource collection
#
# @return [Array<Chef::Resource>]
def rssh_resources
  run_context.resource_collection.select do |resource|
    resource.is_a?(Chef::Resource::RsshUser)
  end
end

# The list of rssh users defined in the resource collection.
#
# @return [Hash]
def rssh_users
  rssh_resources.reduce({}) do |hash, resource|
    if resource.config_path == new_resource.config_path && resource.action == :add
      hash[resource.name] ||= {}
      hash[resource.name] = resource.send('options')
    end

    hash.merge!(node['rssh']['user'])
    hash
  end
end
