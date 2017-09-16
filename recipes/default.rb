# fix locale on ubuntu
include_recipe 'locale'

include_recipe "apt"

package node['usability']['packages']

link "/etc/localtime" do
  to "/usr/share/zoneinfo/Europe/Moscow"
end

cookbook_file "/etc/timezone"

package "tzdata" do
  action :upgrade
end

cookbook_file "/usr/share/ne/syntax/xml.jsf" do
  source "ne.xml.conf"
end

file "/etc/update-motd.d/10-help-text" do
    action :delete
end

file "/etc/update-motd.d/51-cloudguest" do
    action :delete
end
