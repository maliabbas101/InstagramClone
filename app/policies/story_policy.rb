# frozen_string_literal: true
class StoryPolicy < ApplicationPolicy
  include UsersHelper

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    if user_auth?
      if !@record.empty?
        return true if user.following?(user_details(@record.first.user_id)) || check_owner? || @record.first.user.is_public?
      end
    end
  end

  def create?
    user_auth?
  end

  def show?
    if user_auth?
      return true if user.following?(user_details(@record.user_id)) || user_is_owner_ofrecord? || @record.user.is_public?
    end
  end

  def edit?
    if user_auth?
      return true if user_is_owner_ofrecord?
    end
  end

  def destroy?
    if user_auth?
      return true if user_is_owner_ofrecord?
    end
  end

  private

  def check_owner?
    @user.id.eql? @record.first.user_id
  end

end
