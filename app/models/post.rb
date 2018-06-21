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

  scope :most_recent, -> { order(published_at: :desc) }
  scope :published, -> { where(published: true) }

  def date_published
    if published_at.present?
      "投稿日：#{published_at.to_s(:published_at)}"
    else
      "投稿日 : まだ投稿されていません。"
    end
  end

  def date_created
    "作成日 : #{created_at.to_s(:created_at)}"
  end

  # publish/unpulish action in posts.controller.rb
  def publish
    update(published: true, published_at: Time.now)
  end

  def unpublish
    update(published: false, published_at: nil)
  end

  belongs_to :author
  # has_many :comments

end
