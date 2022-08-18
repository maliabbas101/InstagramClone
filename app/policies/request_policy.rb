# frozen_string_literal: true
class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    !check_authn?
  end

  private
  def check_authn?
    @user.eql? nil
  end
end
