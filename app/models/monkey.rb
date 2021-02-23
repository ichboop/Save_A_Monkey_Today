class Monkey < ApplicationRecord
  belongs_to :user
  has_many :getaways
  validates :name, presence: true, uniqueness: true
  validates :city, :species, presence: true
end
