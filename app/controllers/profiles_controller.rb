class ProfilesController < ApplicationController
  before_action :set_user
  
  def show
    authorize(@user)
  end

  def edit
    authorize(Item)
  end

  def update
    authorize(@user)

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

  def set_user
    @user = User.find(current_user.id)
  end
end
