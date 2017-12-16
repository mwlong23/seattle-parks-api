class Neighborhood < ApplicationRecord
  has_many :parks, dependent: :destroy
  validates_presence_of :name

  scope :search, -> (neighborhood) { where("name like?", "%#{neighborhood}%")}
end
