class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :description
      t.string :category
      t.references :family_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
