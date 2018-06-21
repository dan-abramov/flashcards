class AdminPolicy < ApplicationPolicy
  def has_rights?
    return true if @user.has_role? :admin
  end
end
