class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, :user_id, presence: true

  acts_as_taggable
end
