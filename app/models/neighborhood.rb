class Neighborhood < ApplicationRecord
  has_many :parks, dependent: :destroy
  validates_presence_of :name

  scope :search, -> (neighborhood) { where("name like?", "%#{neighborhood}%")}

  def self.random
    where( 'id = ?', rand(Neighborhood.all.first.id..Neighborhood.all.last.id))
  end
end
