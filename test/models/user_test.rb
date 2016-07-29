require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user= User.new(name: "carol mukami", email: "carolmurithi1994@gmail.com")
	end

	test "should be valid" do
		assert @user.valid?
	end
	test "name should not be too long" do
		@user.name="a" * 51
		assert_not@user.valid?
	end
	test "email should not be too long" do
		@user.email="a" * 244 + "@carolmurithi1994.com"
		assert_not@user.valid?
	end
end
