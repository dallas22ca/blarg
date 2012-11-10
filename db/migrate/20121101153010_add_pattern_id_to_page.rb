class AddPatternIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :pattern_id, :integer
    add_index :pages, :pattern_id
  end
end
