class Comment < ApplicationRecord
  validates :content, length: {maximum: 140},
                      presence: true
  validates :user_id, presence: true

  belongs_to :micropost
  belongs_to :user
end
