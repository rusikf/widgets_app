class CreateWidgets < ActiveRecord::Migration[5.2]
  def change
    create_table :widgets do |t|
      t.belongs_to :user
      t.string :name
      t.text :description
      t.integer :kind
      t.string :uid

      t.index :kind
      t.index :name
      t.index :uid
    end
  end
end
