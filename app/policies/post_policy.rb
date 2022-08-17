# frozen_string_literal: true
class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    check_user?
  end

  def create?
    check_user?
  end

  def show?
    user.present?

  end

  def edit?
    check_user_owns_record?
  end

  def update?
    check_user_owns_record?
  end

  def destroy?
    check_user_owns_record?
  end

  private

  def check_user?
    user.present?
  end

  def check_user_owns_record?
    @user.eql? @record.user
  end
end
