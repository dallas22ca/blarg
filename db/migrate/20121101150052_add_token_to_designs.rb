class AddTokenToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :token, :string
  end
end
