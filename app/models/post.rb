class Post < ApplicationRecord
  # belongs_to :object, class_name: "object", foreign_key: "object_id"
  belongs_to :user
end

