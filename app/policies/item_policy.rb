class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.general?
  end

  def new
    user.admin? || user.general?
  end

  def create?
    user.admin? || user.general?
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
