class Park < ApplicationRecord
  belongs_to :neighborhood
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :address
  validates_presence_of :latitude
  validates_presence_of :longitude
end
