class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.text :user_id
      t.string :encrypted_password
      t.timestamps
    end
  end
end
