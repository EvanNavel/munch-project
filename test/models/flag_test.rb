# == Schema Information
#
# Table name: flags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_flags_on_post_id  (post_id)
#  index_flags_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class FlagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
