# frozen_string_literal: true
class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_auth?
  end

  def destroy?
    if user_auth?
      return true if user_is_owner_ofrecord?
    end
  end
end
