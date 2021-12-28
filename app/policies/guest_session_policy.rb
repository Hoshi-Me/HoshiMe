class GuestPolicy < ApplicationPolicy
  def create?
    user.guest?
  end
end
