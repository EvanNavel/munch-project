# == Schema Information
#
# Table name: forks
#
#  id         :bigint           not null, primary key
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

  attribute :title, :string
  attribute :body, :text
  attribute :meal, :string
  attribute :difficulty, :string
  attribute :cuisine, :string

  validate :image_type, :image_size

  private

  def image_type
      if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, "must be a JPEG or PNG")
  end
  end

  def image_size
      if image.attached? && image.byte_size > 5.megabytes
      errors.add(:image, "size must be less than 5MB")
  end
  end
end
