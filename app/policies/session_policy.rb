class SessionPolicy < ApplicationPolicy
  def new
    user.nil? || user.admin?
  end

  def create?
    user.nil? || user.admin?
  end

  def destroy?
    user.admin? || user.general?
  end
end
