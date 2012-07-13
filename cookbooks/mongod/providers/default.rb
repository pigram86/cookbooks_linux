#
# Cookbook Name:: mongod
#
#  Copyright 2012 Ryan J. Geyer
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

action :lock_for_backup do
  bash "Lock the mongo server from writes" do
    code "mongo admin --eval 'db.runCommand({fsync:1,lock:1})'"
  end
end

action :unlock_for_backup do
  bash "Unlock the mongo server for writes" do
    code "mongo admin --eval 'db.$cmd.sys.unlock.findOne()'"
  end
end