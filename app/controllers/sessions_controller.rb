class SessionsController < ApplicationController
  skip_before_action :require_login
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
    authorize(User, policy_class: SessionPolicy)

    logout
    redirect_to root_path, success: t('.success')
  end

  private

  def reject_user
    @user = User.find_by(email: params[:email].downcase)
    return unless !@user.nil? && (@user.valid_password?(params[:password]) && (@user.is_valid == false))

    redirect_to login_path, danger: t('.danger')
  end
end
