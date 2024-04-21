class AddColumnToParcel < ActiveRecord::Migration[7.1]
  def change
    add_column :parcels, :title, :string
  end
end
