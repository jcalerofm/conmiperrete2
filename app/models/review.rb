class Review < ApplicationRecord
  belongs_to :place
  belongs_to :user
  # validates :content, length: {minimum: 30}
end
