class Neighborhood < ApplicationRecord
  has_many :parks
  validates_presence_of :name
end
