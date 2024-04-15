# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  body        :string
#  cuisine     :string
#  difficulty  :string
#  flags_count :integer
#  meal        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
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

    has_many :comments, dependent: :destroy
    has_many :flags, dependent: :destroy
    has_many :forks

    def liked_by?(user)
        likes.exists?(user: user)
      end

      def flagged?(user)
        flags_count.to_i.positive?(user: user)
      end
    
      def forked?
        forks.any?
      end
    
      def forked_by?(user)
        forks.exists?(user: user)
      end
    
      def forked_from
        Post.find_by(id: forked_from_id)
      end
end
