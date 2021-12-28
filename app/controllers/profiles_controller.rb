class ProfilesController < ApplicationController
  before_action :get_user
  
  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profiles_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(current_user.id)
    authorize(@user, policy_class: ProfilePolicy)
  end
end
