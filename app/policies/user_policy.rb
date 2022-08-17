# frozen_string_literal: true
class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def search?
    user_is_there?
  end

  def feed?
    user_is_there?
  end

  def show?
    user_is_there?
  end

  def user_is_there?
    user.present?
  end
end
