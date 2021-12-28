class GuestSessionsController < ApplicationController
  def create
    @user = User.guest
    auto_login(@user)

    authorize(@user)

    redirect_to new_three_item_path
  end
end
