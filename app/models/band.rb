class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
end
