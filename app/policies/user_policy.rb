# frozen_string_literal: true
class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def search?
    user_auth?
  end

  def feed?
    user_auth?
  end

  def show?
    user_auth?
  end

end
