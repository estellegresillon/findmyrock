class Band < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  scope :next, lambda {|id| where("id > ?",id).order("id ASC") } # this is the default ordering for AR
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  def next
    Band.next(self.id).first
  end

  def previous
    Band.previous(self.id).first
  end
end
