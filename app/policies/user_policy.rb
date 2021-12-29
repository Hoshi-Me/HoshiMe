class UserPolicy < ApplicationPolicy
  def show?
    user.admin? || user.general?
  end

  def new?
    user.admin? || user.guest?
  end

  def create?
    user.admin? || user.guest?
  end

  def edit?
    user.admin? || user.general?
  end

  def update?
    user.admin? || user.general?
  end

  def destroy?
    user.admin? || user.general?
  end
end
