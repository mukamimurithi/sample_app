require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user=User.new(name: "carol mukami", email: "carolmurithi994@gmail.com")
	end
	test "should be valid" do
	assert @user.valid?
	end
  
end
