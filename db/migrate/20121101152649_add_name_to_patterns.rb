class AddNameToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :name, :string
  end
end
