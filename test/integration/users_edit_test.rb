require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

 def setup
 	@user = users(:carol)
end
test "unsuccessiful edit" do 
get edit_user_path(@user)
	assert_template 'users/edit'
	patch user_path(@user), user: { name: "",
	                                email: "carolmukami1994@gmail.com",
	                                 password: "carolmukami",
	                                  password_confirmation: "carolmukami" }
assert_template "users/edit"
end
end

