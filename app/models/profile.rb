# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  body       :string
#  heading    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Profile < ApplicationRecord
    belongs_to :user
end
