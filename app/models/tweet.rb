class Tweet < ApplicationRecord
  default_scope { order(updated_at: :desc ) }

  belongs_to :user
  has_many_attached :files

  scope :by_user, ->(user_id){ where(user_id: user_id) }
  scope :followings, ->(user_id) { where(user_id: Follow.where(follower_id: user_id).select(:followed_id)) }

  def image_attachments!
    files.select { |file| file.content_type.start_with?('image/') }
  end

  def video_attachments!
    files.select { |file| file.content_type.start_with?('video/') }
  end

  def pdf_attachments!
    files.select { |file| file.content_type.start_with?('application/pdf') }
  end

  def other_attachments!
    files.select { |file| !(file.content_type.start_with?('image/') || file.content_type.start_with?('video/') || file.content_type.start_with?('application/pdf')) }
  end
end
