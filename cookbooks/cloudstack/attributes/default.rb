default[:cloudstack][:package_url] = "http://sourceforge.net/projects/cloudstack/files/Cloudstack%202.2/2.2.13/CloudStack-2.2.13-1-rhel5.tar.gz"
default[:cloudstack][:install_dir] = "/opt/cloudstack"

default[:cloudstack][:csmanage][:vpn][:subnet] = "176.16.1.0"
default[:cloudstack][:csmanage][:vpn][:netmask] = "255.255.255.0"