class Review < ApplicationRecord
  belongs_to :band

  validates :content, presence: true
  validates :commenter, presence: true
  validates :rating, presence: true
  validates :rating, numericality: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
end
