# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :string
#  cuisine    :string
#  difficulty :string
#  meal       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :posts
    )

    validates :title, presence: true
    validates :body, presence: true

    has_many :likes
    has_many :likers, through: :likes, source: :user

    def liked_by?(user)
        likes.exists?(user: user)
      end
end
