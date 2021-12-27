class UserPolicy < ApplicationPolicy
  def new
    user.admin? || user.nereral?
  end

  def create?
    user.admin? || user.nereral?
  end

  def destroy?
    user.admin? || user.nereral?
  end

end