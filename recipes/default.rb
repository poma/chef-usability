# fix locale on ubuntu
include_recipe 'locale'

include_recipe "apt"

node['usability']['packages'].each do |a_package|
  package a_package
end
