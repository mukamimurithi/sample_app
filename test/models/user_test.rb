require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user= User.new(name: "carol mukami", email: "carolmurithi1994@gmail.com")
	end

	test "email addresses should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
	end
end
