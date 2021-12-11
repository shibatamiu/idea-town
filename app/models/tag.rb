class Tag < ApplicationRecord

    has_many :thought_tags, dependent: :destroy
    has_many :thoughts, through: :thought_tags

end
