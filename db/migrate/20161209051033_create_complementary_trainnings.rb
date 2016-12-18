class CreateComplementaryTrainnings < ActiveRecord::Migration[5.0]
  def change
    create_table :complementary_trainnings do |t|
      t.string :name_instituition_comp
      t.string :course_comp
      t.integer :workload
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
