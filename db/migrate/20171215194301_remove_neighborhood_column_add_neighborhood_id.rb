class RemoveNeighborhoodColumnAddNeighborhoodId < ActiveRecord::Migration[5.0]
  def change
    remove_column :parks, :neighborhood
    add_column :parks, :neighborhood_id, :integer
  end
end
