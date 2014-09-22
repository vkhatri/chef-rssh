rssh Cookbook
=============

Chef Cookbook to manage rssh configuration.


## Repository

https://github.com/vkhatri/chef-rssh


## Platforms

* Debian, Ubuntu

* CentOS 6+, Red Hat 6+, Fedora, Amazon


## Recipes

- `rssh::default`      - install and configure rssh


## rssh user LWRP

**LWRP**

You could and should use the user LWRP if you want to define rssh users from
various cookbooks around chef such as:


    rssh_user "some_user" do
      options "some_options"
    end

    rssh_user "another_user" do
      options "more options"
    end


**LWRP Options**

- *name* (required) - rssh user name
- *action* (optional) - default :add
- *options* (options) - rssh user options
- *config_path* (optional) - rssh config file path


## Core Attributes

* `default[:rssh][:config_path]` (default: '/etc/rssh.conf'): rssh config file path
* `default[:rssh][:options]` (default: 'LOG_USER'): Hash of rssh options attributes, e.g. {"option_name" => "option_value"}
* `default[:rssh][:options][:logfacility]` (default: 'LOG_USER'): syslog facility rssh logs to
* `default[:rssh][:options][:umask]` (default: '022'): umask value for file creations in the scp/sftp session
* `default[:rssh][:user]` (default: {}): rssh users options attribute, e.g. {"user_name" => "options"}
* `default[:rssh][:allow]` (default: ["scp", "rsync", "sftp"]): rssh allow* service options attribute


## Usage

**Add User via Node attribute**

    "default_attributes": {
      "rssh": {
        "user": {
          "foo": "foo-options"
        }
      }
    }


**Add User via LWRP**

    rssh_user 'foo' do
      options "foo-options"
    end


**Add to run_list**

Just include `rssh` in your node's `run_list` or role's `run_list`:


    {
      "name":"my_name",
      "run_list": [
        "recipe[rssh::default]"
      ]
    }


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors:: Virender Khatri, Dan Fruehauf and [Contributors]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[Contributors]: https://github.com/vkhatri/chef-rssh/graphs/contributors
