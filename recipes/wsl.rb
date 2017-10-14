sudo 'no-passwd' do
  user "%sudo"
  runas 'root'
  group 'root'
  nopasswd true
end

sshd_config = "/etc/ssh/sshd_config"
privilege_separation = /^UsePrivilegeSeparation yes$/m

ruby_block "Disable privilege separation" do
  block do
    sed = Chef::Util::FileEdit.new(sshd_config)
    sed.search_file_replace(privilege_separation, 'UsePrivilegeSeparation no')
    sed.write_file
  end
  only_if { ::File.readlines(sshd_config).grep(privilege_separation).any? }
end if platform_family?('debian')