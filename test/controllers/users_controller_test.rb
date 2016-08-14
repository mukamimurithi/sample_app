require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	def setup
	@user = users(:carol)
	@other_user = users(:doreen)
end

test "should get new" do
get signup_path
assert_response :success
end

test "should redirect edit when not logged in" do
get edit_user_path(id: @user.id) 
assert_not flash.empty?
assert_redirected_to login_url
end

test "should redirect update when not logged in" do
patch update_user_path(id: @user.id), params: { user: { name: @user.name, email: @user.email }}
assert_not flash.empty?
assert_redirected_to login_url
end

test "should redirect edit when logged in as wrong user" do
	log_in_as(@other_user)
	get edit_user_path(id: @user.id)
	assert flash.empty?
	assert_redirected_to root_url
end

test "should redirect update when logged in as wrong user" do
	log_in_as(@other_user)
	patch update_user_path(id: @user.id), params: { user: { name: @user.name, email: @user.email }}
	assert flash.empty?
	assert_redirected_to root_url
end

test "should redirect destroy when not logged in "do
assert_no_difference 'User.count' do
delete user_path(@user), id: @user
end
assert_redirected_to login_url
end
test "should redirect destroy when logged in as a non-admin"do
log_in_as(@other_user)
assert_no_difference 'User.count' do
delete user_path(@user), id: @user
end
assert_redirected_to login_url
end
end