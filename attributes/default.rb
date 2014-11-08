
# default['rssh'] = {
default['rssh']['config_path'] = '/etc/rssh.conf'
default['rssh']['allow'] = %w(scp sftp rsync)

# 'user_name' : "options"
# e.g.'user_name' : "011:00001:/usr/local/my chroot"
# Alternatively, you should use the `rssh_user` LWRP
default['rssh']['user'] = {}
default['rssh']['options']['logfacility'] = 'LOG_USER'
default['rssh']['options']['umask'] = '022'
