class Post < ApplicationRecord

  scope :most_recent, -> { order(id: :desc) }

  def create_date_published
    "投稿日：#{created_at.strftime('%Y年%m月%d日')}"
  end

end
