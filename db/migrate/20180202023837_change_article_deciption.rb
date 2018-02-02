class ChangeArticleDeciption < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      change_table :articles do |t|
        dir.up { t.change :decription, :string }
        dir.down { t.change :description, :string }
      end
    end
  end
end
