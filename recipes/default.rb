# fix locale on ubuntu
include_recipe 'locale'

include_recipe "apt"

node['usability']['packages'].each do |a_package|
  package a_package
end

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
