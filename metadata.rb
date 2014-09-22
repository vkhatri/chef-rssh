name             'rssh'
maintainer       'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures rssh'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'
provides         'rssh::default'

supports 'debian'
supports 'ubuntu'
supports 'centos'
supports 'redhat'
supports 'amazon'
supports 'fedora'

recipe 'rssh::default', 'Installs and configures rssh'

attribute 'rssh/options',
          :display_name => 'rssh options',
          :description  => 'Hash of rssh options attributes, e.g. {"option_name" => "option_value"}',
          :type         => 'hash'

attribute 'rssh/allow',
          :display_name => 'rssh allow services',
          :description  => 'Array of rssh allow service options attribute, e.g. ["scp", "rsync", "sftp"]',
          :type         => 'array'

attribute 'rssh/user',
          :display_name => 'rssh user configuration',
          :description  => 'Hash of rssh user attributes, e.g. {"user_name" => "options"}',
          :type         => 'hash'
