default['rssh'] = {
  'allow' => [
    'scp',
    'sftp',
    'rsync'
  ],
  'user' => {
#    'user_name' : "options"
#e.g.'user_name' : "011:00001:/usr/local/my chroot"
  },
  'options' => {
    'logfacility' => 'LOG_USER',
    'umask' => '022'
  }
}
