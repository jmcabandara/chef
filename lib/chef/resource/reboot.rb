#
# Author:: Chris Doherty <cdoherty@chef.io>)
# Copyright:: Copyright 2014-2016, Chef, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "chef/resource"

class Chef
  class Resource
    # Use the reboot resource to reboot a node, a necessary step with some
    # installations on certain platforms. This resource is supported for use on
    # the Microsoft Windows, macOS, and Linux platforms.
    #
    # In using this resource via notifications, it's important to *only* use
    # immediate notifications. Delayed notifications produce unintuitive and
    # probably undesired results.
    class Reboot < Chef::Resource
      resource_name :reboot

      introduced "12.0"

      allowed_actions :request_reboot, :reboot_now, :cancel
      default_action :nothing # make sure people are quite clear what they want

      property :reason, String, default: "Reboot by Chef"
      property :delay_mins, Integer, default: 0
    end
  end
end
