class AdminPolicy < ApplicationPolicy
  def has_rights?
    @user.has_role? :admin
  end
end
