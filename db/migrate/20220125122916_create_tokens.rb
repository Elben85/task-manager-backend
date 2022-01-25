class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.integer :userId
      t.string :token
      t.string :username

      t.timestamps
    end
  end
end
