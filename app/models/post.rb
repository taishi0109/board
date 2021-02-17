class Post < ApplicationRecord
  belongs_to :topic
  validates :body, { presence: true, length: { maximum: 30 } }
end
