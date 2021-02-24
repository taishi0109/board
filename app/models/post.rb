class Post < ApplicationRecord
  belongs_to :topic
  validates :body, { presence: true, length: { maximum: 150 } }
  has_many :likes, dependent: :destroy
  before_create :test_before_create

  def test_before_create
    last_id = Post.where(topic_id: topic_id).maximum(:sub_id) || 0
    self.sub_id = last_id + 1
  end
end
