class ThreeItemPolicy < ApplicationPolicy
  def new?
    user.guest? || user.admin?
  end

  def create?
    user.guest? || user.admin?
  end
end
