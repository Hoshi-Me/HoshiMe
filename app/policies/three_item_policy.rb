class UserPolicy < ApplicationPolicy
  def new
    user.guest?
  end

  def create?
    user.guest?
  end
end