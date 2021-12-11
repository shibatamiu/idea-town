class Thought < ApplicationRecord
    belongs_to :user

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user

    has_many :counts, dependent: :destroy
    has_many :counted_users, through: :counts, source: :user

    has_many :comments, dependent: :destroy

    mount_uploader :image, ImageUploader

    has_many :thought_tags, dependent: :destroy
    has_many :tags, through: :thought_tags

    #scope :select_thought, ->(thought) { where('name = ?', thought) }
    scope :select_thought, ->(thought) { where('thoughts.created_at = ?', thought) }
end
