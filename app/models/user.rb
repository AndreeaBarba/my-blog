class User < ApplicationRecord
  include BCrypt

  has_many :posts, foreign_key: :author_id, class_name: "Post"
  has_many :comments, foreign_key: :commentor_id, class_name: "Comment"

  validates :usename, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
