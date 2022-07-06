class Booking < ApplicationRecord
  belongs_to :toy
  belongs_to :user
  validates :date, presence: true
end
