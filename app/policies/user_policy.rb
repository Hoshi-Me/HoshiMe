class UserPolicy < ApplicationPolicy
  def new
    user.guest?
  end

  def create?
    user.guest?
  end

  def destroy?
    user.admin? || user.general?
  end
end
