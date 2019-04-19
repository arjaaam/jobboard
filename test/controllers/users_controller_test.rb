require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user=User.new()
  end

  test 'is valid user?' do
    user = User.new(email:"tester@gmail.com", category_id: "1")
    assert user.valid?
  end

  test "create jobs with valid information" do
    get new_job_path
    post '/users#create', params: { user: { email: "tester@gmail.com", category_id: "1"}}
    assert_response :redirect
  end

  test "should not save user without any data" do
    user = User.new()
    assert_not user.save
  end

  test "should not save user without email" do
    user = User.new(category_id: "1")
    assert_not user.save
  end

end
