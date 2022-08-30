# frozen_string_literal: true
class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user_auth?
  end

  def create?
    if user_auth?
      return true if @user.id.eql? @record.requester_id
    end
  end

  def update?
    if user_auth?
      return true if @user.id.eql? @record.reciever_id
    end
  end

  def destroy?
    if user_auth?
      return true if @user.id.eql? @record.reciever_id
    end
  end

end
