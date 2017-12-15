class Park < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :address
  validates_presence_of :bathroom
  validates_presence_of :drinking_fountain
  validates_presence_of :dog_park
  validates_presence_of :playground
  validates_presence_of :latitude
  validates_presence_of :longitude

end
