require 'test_helper'

class UserTest < ActiveSupport::TestCase

def setup
@user = User.new(name: "carol mukami", email: "carolmurithi1995@gmail.com",
password: "carolmukami", password_confirmation: "carolmukami")
end
test "email addresses should be unique" do
duplicate_user = @user.dup
duplicate_user.email = @user.email.upcase
@user.save
assert_not duplicate_user.valid?
end

test "email addresses should be saved as lower-case" do
mixed_case_email = "CArolmUrithi1995@gMail.cOm"
@user.email = mixed_case_email
@user.save
assert_equal mixed_case_email.downcase, @user.reload.email
end
test "password should have a minimum length" do
@user.password = @user.password_confirmation = "a" * 5
assert_not @user.valid?
end
test "email validation should reject invalid addresses" do
invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
foo@bar_baz.com foo@bar+baz.com foo@bar..com]
invalid_addresses.each do |invalid_address|
@user.email = invalid_address
assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
 end
end
test "authenticated? should return false for user with nil digest" do
	assert_not @user.authenticated?(:remember, '')
end

test "associated microposts should be destroyed" do
  @user.save
  @user.microposts.create!(content: "Lorem ipsum")
  assert_difference 'Micropost.count', -1 do
     @user.destroy
 end
end
test "should follow and unfollow a user" do
	carol = users(:carol)
	doreen = users(:doreen)
	assert_not carol.following? (doreen)
	carol.follow(doreen)
	assert carol.following?(doreen)
	assert doreen.followers.include?(carol)
	carol.unfollow(doreen)
	assert_not carol.following?(doreen)
end
end
