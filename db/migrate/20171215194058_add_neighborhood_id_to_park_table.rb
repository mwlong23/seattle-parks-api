class AddNeighborhoodIdToParkTable < ActiveRecord::Migration[5.0]
  def change
    add_column :parks, :neighborhood, :integer
  end
end
