class AddDesignIdToSites < ActiveRecord::Migration
  def change
    add_column :sites, :design_id, :integer
  end
end
