#
# Cookbook Name:: rails
# Recipe:: default
#
#  Copyright 2011-2012 Ryan J. Geyer
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

rightscale_marker :begin

# include_recipe "rubygems::default"

gem_package "rails" do
  version node[:rails][:version] if node[:rails][:version]
  gem_binary "/usr/local/bin/gem" if ::File.exists?("/usr/local/bin/ree-version")
end

template "/etc/profile.d/rails.sh" do
  source "rails-profile.d.sh.erb"
end

rightscale_marker :end