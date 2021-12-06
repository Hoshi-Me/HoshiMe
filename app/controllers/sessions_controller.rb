class SessionsController < ApplicationController
  before_action :reject_user, only: %i[create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.success')
  end

  private

  def reject_user
    @user = User.find_by(email: params[:email].downcase)
    if (@user.valid_password?(params[:password]) && (@user.is_valid == false))
      redirect_to new_user_path, danger: t('.danger')
    end
  end
end
