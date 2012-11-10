class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer :section_id
      t.string :style
      t.integer :ordinal

      t.timestamps
    end
    add_index :widgets, :section_id
    add_index :widgets, :ordinal
  end
end
