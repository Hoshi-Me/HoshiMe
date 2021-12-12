class GuestSessionsController < ApplicationController

  def create
    @user = User.guest
    auto_login(@user)
    redirect_to new_three_item_path, notice: "ゲスト(#{@user.name})としてログインしました"
  end
end