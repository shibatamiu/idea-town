class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :thoughts
  has_many :thoughts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_thoughts, through: :likes, source: :thought
  def already_liked?(thought)
    self.likes.exists?(thought_id: thought.id)
  end

  has_many :counts, dependent: :destroy
  has_many :counted_thoughts, through: :counts, source: :thought
  def already_counted?(thought)
    self.counts.exists?(thought_id: thought.id)
  end

  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }


  scope :thought_users, ->(thought) { joins(:thoughts).merge(Thought.select_thought(thought)) }


end
