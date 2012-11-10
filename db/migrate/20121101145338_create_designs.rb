class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.text :css
      t.text :js

      t.timestamps
    end
  end
end
