class Monkey < ApplicationRecord
  belongs_to :user
  has_many :getaways, dependent: :destroy
  has_many_attached :photos
  validates :name, presence: true, uniqueness: true
  validates :city, :species, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :species, presence: true
  # validates :address, presence: true
  # geocoded_by :address
  # after_validation :geocode
  # , if: :will_save_change_to_address?
end
