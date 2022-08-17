# frozen_string_literal: true
class StoryPolicy < ApplicationPolicy
  include UsersHelper

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    if !check_authn?
      if !@record.empty?
        user.following?(user_details(@record.first.user_id)) or check_owner?
      end
    end
  end

  def new?
    check_user?
  end

  def show?
    if !check_authn?
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
    @user.id.eql? @record.user_id
  end

  def check_owner?
    @user.id.eql? @record.first.user_id
  end

  def check_authn?
    @user.eql? nil
  end
end
