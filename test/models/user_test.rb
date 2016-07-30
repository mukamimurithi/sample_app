require 'test_helper'

class UserTest < ActiveSupport::TestCase

 def setup
@user = User.new(name: "carol mukami", email: "carolmurithi1994@gmail.com",
password: "32002892", password_confirmation: "32002892")
end
test "password should have a minimum length" do
@user.password = @user.password_confirmation = "a" * 5
assert_not @user.valid?
end
test "email addresses should be unique" do
		duplicate_user = @user.dup
		@user.save
		assert_not duplicate_user.valid?
end
end
