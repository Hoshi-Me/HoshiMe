class GuestSessionsController < ApplicationController
  skip_before_action :require_login

  def create
    @user = User.guest
    auto_login(@user)
    redirect_to new_three_item_path
  end
end
