# frozen_string_literal: true
class PostPolicy < ApplicationPolicy
  include UsersHelper
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    check_user?
  end

  def show?
    if check_user?
      user.following?(user_details(@record.user_id)) or check_user_owns_record?
    end
  end

  def edit?
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
