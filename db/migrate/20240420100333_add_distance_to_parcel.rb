class AddDistanceToParcel < ActiveRecord::Migration[7.1]
  def change
    add_column :parcels, :distance, :string
  end
end
