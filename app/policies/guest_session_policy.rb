class UserPolicy < ApplicationPolicy
  def create?
    user.guest?
  end
end
