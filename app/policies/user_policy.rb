# frozen_string_literal: true
class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def user_is_there?
    user.present?
  end
end
