# Description: ChefVault::User class
# Copyright 2013-15, Nordstrom, Inc.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class ChefVault
  class User
    def initialize(vault, username)
      @item = ChefVault::Item.load(vault, username)
    end

    def [](key)
      @item[key]
    end

    def decrypt_password
      puts "WARNING: This method is deprecated, please switch to item['value'] calls"
      @item["password"]
    end
  end
end
