# == Schema Information
#
# Table name: posts
#
#  id               :bigint(8)        not null, primary key
#  title            :string(255)
#  body             :text(65535)
#  description      :text(65535)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string(255)
#  author_id        :integer
#  published        :boolean          default(FALSE)
#  published_at     :datetime
#

class Post < ApplicationRecord

  scope :most_recent, -> { order(id: :desc) }
  scope :published, -> { where(published: true) }

  def create_date_published
    "投稿日：#{created_at.strftime('%Y年%m月%d日')}"
  end

  belongs_to :author

end
