class Count < ApplicationRecord
  belongs_to :thought
  belongs_to :user

  validates_uniqueness_of :thought_id, scope: :user_id
end
