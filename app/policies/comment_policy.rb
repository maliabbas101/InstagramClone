# frozen_string_literal: true
class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    !check_authn?
  end

  def show?
    !check_authn?
  end

  def edit?
    if !check_authn?
      check_user_owns_record?
    end
  end

  def destroy?
    if !check_authn?
      check_user_owns_record?
    end
  end

  private

  def check_authn?
    @user.eql? nil
  end

  def check_user_owns_record?
    @user.eql? @record.user
  end

end
