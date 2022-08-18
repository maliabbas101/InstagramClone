# frozen_string_literal: true
class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user_auth?
  end

  def show?
    if user_auth? && record_not_nil?
      return true if @user.following?(@record.user) || !check_private? || @user == @record.user
    end
  end

  def create?
    return true if record_not_nil? && user_auth?
  end

  def update?
    return true if user_auth? && record_not_nil? && user_is_owner_ofrecord?
  end

  def destroy?
    return true if user_auth? && record_not_nil? && user_is_owner_ofrecord?
  end

end
