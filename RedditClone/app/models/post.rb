# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :sub_id, :author_id, presence: true
  validates :title, uniqueness: {scope: :sub_id,
    message: "Posts within a unique sub must have unique titles"}

  belongs_to :sub

  belongs_to :author,
    class_name: :User
end
