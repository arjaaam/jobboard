class UsersController < ApplicationController
 skip_before_action :verify_authenticity_token, raise: false
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:notice]="User was successfully created"
      UserMailer.everyday_email(@user).deliver
      redirect_to jobs_path
    else
        redirect_to jobs_path
    end
  end

  private

  def user_params
    params.permit(:email,:category_id)
  end

end
