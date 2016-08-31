require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

 def setup
 	@user = users(:carol)
end

test "unsuccessiful edit" do 
	log_in_as(@user)
get edit_user_path(@user)
	assert_template 'users/edit'
	patch user_path(@user), params: {user: { name: "",
	                                email: "carolmukami1994@gmail.com",
	                                 password: "carolmukami",
	                                  password_confirmation: "carolmukami" }}
assert_template "users/edit"
end

test "successful edit" do
	log_in_as(@user)
get edit_user_path(@user)
assert_template 'users/edit'
name = " Ste kami"
email = "carolmukam@gmail.com"
patch user_path(@user), params: {user: { name: name,
                               email: email,
                               password: "",
                                password_confirmation: "" }
}
assert_not flash.empty?
assert_redirected_to @user
@user.reload
assert_equal @user.name, name
assert_equal @user.email, email
end
end