class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User", foreign_key: :author_id
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
