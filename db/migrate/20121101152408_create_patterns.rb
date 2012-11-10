class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.text :html
      t.integer :design_id

      t.timestamps
    end
    add_index :patterns, :design_id
  end
end
