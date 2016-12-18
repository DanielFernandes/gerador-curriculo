class CreatePersonalData < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_data do |t|
      t.string :name
      t.integer :age
      t.string :cnh
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
