class CreateMenuitems < ActiveRecord::Migration[6.0]
  def change
    create_table :menuitems do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :diet_type
    end
  end
end
