class Article < ApplicationRecord
  include Visible
  
  has_rich_text :body

  has_many :comments, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true,
                   length: {minimum: 5}
  validates :body, presence: true,
                   length: {minimum: 5}
end
