class CreateDecabitsAuthAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :decabits_auth_accounts do |t|
      t.text :user_id
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
  end
end
