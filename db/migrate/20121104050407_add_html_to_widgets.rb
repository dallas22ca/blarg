class AddHtmlToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :html, :text
  end
end
