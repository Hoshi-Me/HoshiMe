class GuestSessionsController < ApplicationController
  def create
    authorize(User)

    @user = User.guest
    auto_login(@user)
    redirect_to new_three_item_path
  end
end
