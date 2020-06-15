class AddImageurlToMenuitems < ActiveRecord::Migration[6.0]
  def change
    add_column :menuitems, :imageurl, :string
  end
end
