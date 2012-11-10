class AddElementToSections < ActiveRecord::Migration
  def change
    add_column :sections, :element, :string
  end
end
