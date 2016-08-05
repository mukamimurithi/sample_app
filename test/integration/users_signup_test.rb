require 'test_helper'
class UsersSignupTest < ActionDispatch::IntegrationTest
test "invalid signup information" do
get signup_path
assert_no_difference 'User.count' do
post users_path, params: {user: { name: "",
                                     email: "carolmurithi1995@gmail.com", 
                                     password: "carol",
                                     password_confirmation: "carolmukami" }
                                 }
end
assert_template 'users/new'
end
test "valid signup information" do
get signup_path
assert_difference 'User.count', 1 do
post_via_redirect users_path, params: { user: { name: "carol mukami",
	                                  email: "carolmurithi1995@gmail.com",
                                       password: "carolmukami",
                                     password_confirmation: "carolmukami" }

                                 }

end
assert_template 'users/show'
end

end
