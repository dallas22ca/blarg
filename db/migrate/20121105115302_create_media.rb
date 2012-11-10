class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :site_id

      t.timestamps
    end
    add_index :media, :site_id
  end
end
