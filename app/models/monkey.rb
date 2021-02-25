class Monkey < ApplicationRecord
  belongs_to :user
  has_many :getaways
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :city, :species, presence: true
  # geocoded_by :address
  # after_validation :geocode
  # , if: :will_save_change_to_address?
end
