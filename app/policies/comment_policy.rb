# frozen_string_literal: true
class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    if user_auth?
      return true if user.following?(@record.user) || user_is_owner_ofrecord? || @record.user.is_public?
    end
  end

  def update?
    if user_auth?
      return true if user_is_owner_ofrecord?
    end
  end

  def destroy?
    if user_auth?
      return true if user_is_owner_ofrecord?
    end
  end

end
