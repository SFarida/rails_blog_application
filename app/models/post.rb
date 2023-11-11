class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def all_comments
    comments.all
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
