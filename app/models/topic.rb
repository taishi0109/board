class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy

  def self.search(title)
    title ? where('title LIKE ?', "%#{title}%") : all
  end
end
