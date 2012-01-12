maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
license          IO.read(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'LICENSE')))
description      "Installs/Configures unicorn"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.2"

supports "ubuntu"

%w{rs_utils}.each do |d|
  depends d
end

#recipe "unicorn::enterprise","Installs the unicorn gem for Ruby Enterprise 1.8"
recipe "unicorn::install_unicorn", "Installs the unicorn gem for the system ruby"
recipe "unicorn::setup_unicorn", "Configures unicorn"

attribute "unicorn/version",
  :display_name => "Unicorn Version",
  :description => "The version of the unicorn gem to install.  If not supplied, the latest available version of unicorn will be installed",
  :required => "optional",
  :recipes => ["unicorn::install_unicorn"]

# HAX to make this available to the unicorn install recipe
attribute "rvm/install_path",
  :display_name => "RVM Installation Path",
  :description => "The full path where RVM will be installed. I.E. /opt/rvm",
  :required => "optional",
  :default => "/opt/rvm"