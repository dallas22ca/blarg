class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :ordinal
      t.integer :page_id
      t.text :html
      t.integer :site_id

      t.timestamps
    end
    add_index :sections, :ordinal
    add_index :sections, :page_id
    add_index :sections, :site_id
  end
end
