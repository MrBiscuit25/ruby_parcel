class CreateParcels < ActiveRecord::Migration[7.1]
  def change
    create_table :parcels do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :phone
      t.float :weight
      t.float :length
      t.float :width
      t.float :height
      t.text :origin
      t.text :destination

      t.timestamps
    end
  end
end
