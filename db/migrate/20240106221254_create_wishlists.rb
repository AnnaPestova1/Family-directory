class CreateWishlists < ActiveRecord::Migration[7.1]
  def change
    create_table :wishlists do |t|
      t.text :description
      t.integer :quantity, default: 1
      t.string :link
      t.boolean :purchased, default: false
      t.references :family_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
