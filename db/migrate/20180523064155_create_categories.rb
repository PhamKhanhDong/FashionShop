class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: false
      t.integer :parent_id

      t.timestamps
    end
  end
end
