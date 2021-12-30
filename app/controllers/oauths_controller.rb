class OauthsController < ApplicationController
  skip_before_action :require_login
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if auth_params[:denied].present?
      redirect_to root_path, success: "#{provider.titleize}でログインしました"
      return
    end
    create_user_from(provider) unless (@user = login_from(provider))
    redirect_to root_path, success: "#{provider.titleize}でログインしました"
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    @user.update(role: 'general')
    current_user.items.each do |item|
      item = @user.items.create(name: item.name, degree: item.degree, start_date: item.start_date, finish_date: item.finish_date, price: item.price)
      item.calculate
    end
    reset_session
    auto_login(@user)
  end
end
