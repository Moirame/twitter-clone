class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password
  validates :name, presence: true
  #fix this regex
  validates :email, presence: true,
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
  uniqueness: { case_sensitive: false }

  has_many :microposts
  has_many :favorites
  has_many :comments
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

end
