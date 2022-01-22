class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :userId
      t.string :taskname
      t.string :description
      t.string :tags
      t.string :schedule
      t.string :taskType

      t.timestamps
    end
  end
end
