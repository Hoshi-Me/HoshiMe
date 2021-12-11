class GuestSessionsController < ApplicationController
  skip_before_action :require_login

  def create
    @user = User.guest
    auto_login(@user)
    redirect_to new_board_path(@user)
  end
end
