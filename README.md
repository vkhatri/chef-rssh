rssh Cookbook
=============
Chef Cookbook to manage rssh configuration.

Requirements
------------
### Platforms
- Debian, Ubuntu (rssh)
- CentOS 6+, Red Hat 6+, Fedora, Amazon (rssh)

Attributes
----------
* node["rssh"]["options"] - Hash of rssh options attributes, e.g. {"option_name" => "option_value"}
* node["rssh"]["user"] - Array of rssh allow service options attribute, e.g. ["scp", "rsync", "sftp"]
* node["rssh"]["allow"] - Hash of rssh user attributes, e.g. {"user_name" => "options"}

**Default Attributes**
```rb
default['rssh'] = {
  'allow' => [
    'scp',
    'sftp',
    'rsync'
  ],
  'user' => {
     'user_name' : "options"
  },
  'options' => {
    'logfacility' => 'LOG_USER',
    'umask' => '022'
  }
}
```

Usage
-----
#### rssh::default
Just include `rssh` in your node's `run_list` or role's `run_list`:

```json
{
  "name":"my_name",
  "run_list": [
    "recipe[rssh]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:: vkhatri

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
