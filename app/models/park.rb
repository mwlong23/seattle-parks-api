class Park < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :address
  validates_inclusion_of :bathroom, :in => [true, false]
  validates_inclusion_of :drinking_fountain, :in => [true, false]
  validates_inclusion_of :dog_park, :in => [true, false]
  validates_inclusion_of :playground, :in => [true, false]
  validates_presence_of :latitude
  validates_presence_of :longitude
end
