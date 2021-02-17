class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :title, { presence: true }

  def self.search(title)
    title ? where('title LIKE ?', "%#{title}%") : all
  end
end
