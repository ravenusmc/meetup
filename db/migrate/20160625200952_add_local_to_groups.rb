class AddLocalToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :latitude, :float
    add_column :groups, :longitude, :float
    add_column :groups, :address, :string
    add_column :groups, :city, :string
    add_column :groups, :state, :string
  end
end
