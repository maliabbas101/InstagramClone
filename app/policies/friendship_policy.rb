# frozen_string_literal: true
class FriendshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_auth?
  end

  def destroy?
    user_auth?
  end
end
