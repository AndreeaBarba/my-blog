class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commentor, class_name: "User", foreign_key: :commentor_id

  validates :body, presence: true
end
