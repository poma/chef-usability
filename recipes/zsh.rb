include_recipe "apt"

package "zsh"
package "git"

git '/opt/oh-my-zsh' do
   repository "https://github.com/robbyrussell/oh-my-zsh"
   revision 'master'
   action :sync
end

git '/opt/oh-my-zsh/custom/plugins/zsh-autosuggestions' do
   repository "https://github.com/zsh-users/zsh-autosuggestions"
   revision 'master'
   action :sync
end

git '/opt/oh-my-zsh/custom/plugins/zsh-syntax-highlighting' do
   repository "https://github.com/zsh-users/zsh-syntax-highlighting.git"
   revision 'master'
   action :sync
end

cookbook_file '/root/.zshrc'
#cookbook_file '/home/vagrant/.zshrc' do
#    owner 'vagrant'
#    group 'vagrant'
#end

bash "Set vagrant's shell to zsh" do
  code <<-EOT
    # chsh -s /bin/zsh vagrant
    chsh -s /bin/zsh root
  EOT
  not_if 'test "/bin/zsh" = "$(grep vagrant /etc/passwd | cut -d: -f7)"'
end
