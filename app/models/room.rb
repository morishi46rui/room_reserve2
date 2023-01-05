class Room < ApplicationRecord

  belongs_to :user
  has_many :reservations
  has_one_attached :image

  validates :room_name, presence: true
  validates :room_about, presence: true
  validates :price, presence: true
  validates :adress, presence: true

end
