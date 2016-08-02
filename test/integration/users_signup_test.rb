require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
 test "invalid signup information" do
get signup_path
assert_difference 'User.count', 1 do
post_via_redirect users_path, user: { name: "carol mukami",
email: "carolmurithi1994@gmail.com",
password:
"carolmukami",
password_confirmation: "carolmukami" }
end
assert_template 'users/show'
end
end
