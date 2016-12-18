class CreateInstituitions < ActiveRecord::Migration[5.0]
  def change
    create_table :instituitions do |t|
      t.string :name_instituition
      t.string :graduation
      t.string :course
      t.integer :start_year_grad
      t.integer :exit_year_grad
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
