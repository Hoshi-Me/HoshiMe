class ProfilePolicy < ApplicationPolicy
  def show?
    user.admin? || user.general?
  end

  def edit?
    user.admin? || user.general?
  end

  def update?
    user.admin? || user.general? || user == record
  end
end
