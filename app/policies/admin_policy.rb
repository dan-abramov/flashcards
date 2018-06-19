class AdminPolicy < ApplicationPolicy
  def index?
    if @user
      @user.has_role? :admin
    else
      false
    end
  end
end
