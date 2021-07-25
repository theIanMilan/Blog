class Comment < ApplicationRecord
  include Visible
  belongs_to :article

  validates :commenter, presence: true, 
                        length: {maximum: 20, too_long: "%{count} characters is the maximum allowed"}
  validates :body, presence: true, 
                   length: {maximum: 250, too_long: "%{count} characters is the maximum allowed" }
end