# == Schema Information
#
# Table name: forks
#
#  id         :bigint           not null, primary key
#  body       :text
#  cuisine    :string
#  difficulty :string
#  meal       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_forks_on_post_id  (post_id)
#  index_forks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Fork < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one_attached :image
  has_many :likes, as: :likeable
  has_many :favorites, as: :favoritable
  has_many :comments, as: :commentable
  has_many :flags, as: :flaggable

  validates :title, :body, :meal, :difficulty, :cuisine, presence: true

  validate :image_type, :image_size

  def display_attributes
    {
      title: title,
      body: body,
      meal: meal,
      difficulty: difficulty,
      cuisine: cuisine,
      user_email: user.email,
      created_at: created_at.strftime("%B %d, %Y"),
      likes_count: likes.count
    }
  end

  def liked_by?(user)
    likes.exists?(user: user)
end

def favorite_for(user)
    favorites.find_by(user: user)
  end

def flagged?(user)
    flags.exists?(user: user)
end

  private

  def image_type
    if image.attached? && !image.content_type.in?(%w[image/jpeg image/png])
      errors.add(:image, "must be a JPEG or PNG")
    end
  end

  def image_size
    if image.attached? && image.byte_size > 5.megabytes
      errors.add(:image, "size must be less than 5MB")
    end
  end
end
