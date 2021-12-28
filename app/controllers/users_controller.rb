class UsersController < ApplicationController
  def new
    @user = User.new

    authorize(User)
  end

  def create
    authorize(User)

    if current_user
      @user = User.find(current_user.id)
      if @user.update(user_params)
        redirect_to items_path, success: t('.success')
      else
        flash.now[:danger] = t('.fail')
        render :edit
      end
    else
      redirect_to guest_path, warning: 'お先に欲しいものを登録してください。'
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation).merge(role: 'general')
  end
end
