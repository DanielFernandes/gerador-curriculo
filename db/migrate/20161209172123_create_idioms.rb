class CreateIdioms < ActiveRecord::Migration[5.0]
  def change
    create_table :idioms do |t|
      t.string :language_idiom
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
