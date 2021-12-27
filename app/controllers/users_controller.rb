class UsersController < ApplicationController
  def new
    authorize(User)

    @user = User.new
  end

  def create
    authorize(User)

    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])

    authorize(@user)

    @user.update(is_valid: false)
    reset_session
    redirect_to root_path, success: t('.success')
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
