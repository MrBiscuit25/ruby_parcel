class AddPriceToParcel < ActiveRecord::Migration[7.1]
  def change
    add_column :parcels, :price, :string
  end
end
