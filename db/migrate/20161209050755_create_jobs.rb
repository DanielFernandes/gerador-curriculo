class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :employer
      t.string :office
      t.integer :start_year_job
      t.integer :exit_year_job
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
