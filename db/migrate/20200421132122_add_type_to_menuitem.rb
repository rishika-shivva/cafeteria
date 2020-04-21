class AddTypeToMenuitem < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :type, :string
  end
end
