#
# Cookbook Name:: php5
# Recipe:: default
#
# Copyright 2010, Ryan J. Geyer
#
# All rights reserved - Do Not Redistribute
#

# include_recipe "apache2"

# Possible package ppa's for Ubuntu 10.04
# https://launchpad.net/~nginx/+archive/php5
# https://launchpad.net/~fabianarias/+archive/php5
# https://launchpad.net/~chris-lea/+archive/php5.3.3
if node[:platform] == 'ubuntu' && node[:platform_version] == '10.04'
  e = bash "add-apt-repository" do
    code <<-EOF
apt-get -y -q install python-software-properties
add-apt-repository ppa:fabianarias/php5
apt-get update -o Acquire::http::No-Cache=1
EOF
    action :nothing
  end

  e.run_action(:run)
end

%w{php5-cgi php5-cli smarty php-pear}.each do |pkgs|
  package pkgs do
    action :upgrade
  end
end

node[:php5][:module_list].split(' ').each do |mod|
  package "php5-#{mod}" do
    action :upgrade
  end
end

# This just sets the default include path, useful if we intend to extend it later in other
# conf.d/*.ini files.  If the default isn't already set, it will be excluded when extended
# with a statement like include_path=${include_path} ":/appended/path/to/includes"
template "/etc/php5/conf.d/include_path.ini" do
  source "include_path.ini.erb"
  backup false
end

# Bump up the max file upload size
template "/etc/php5/conf.d/upload_max_filesize.ini" do
  source "upload_max_filesize.ini.erb"
  backup false
end