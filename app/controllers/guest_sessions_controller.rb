class GuestSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create]
  def create
    @user = User.guest
    auto_login(@user)

    authorize(@user)

    redirect_to new_three_item_path
  end
end
