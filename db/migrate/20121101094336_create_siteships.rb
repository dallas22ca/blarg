class CreateSiteships < ActiveRecord::Migration
  def change
    create_table :siteships do |t|
      t.integer :user_id
      t.integer :site_id

      t.timestamps
    end
    add_index :siteships, :user_id
    add_index :siteships, :site_id
  end
end
