class FixcolumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :decription, :description
  end
end
