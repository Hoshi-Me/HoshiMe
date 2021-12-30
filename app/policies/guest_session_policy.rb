class GuestPolicy < ApplicationPolicy
  def create?
    user.guest? || user.admin?
  end
end
