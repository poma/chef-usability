cookbook_file "/etc/bash.bashrc" do
  source "bash.bashrc"
  owner "root"
  group "root"
  mode "0644"
end
