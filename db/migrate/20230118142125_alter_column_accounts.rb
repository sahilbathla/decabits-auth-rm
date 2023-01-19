class AlterColumnAccounts < ActiveRecord::Migration[7.0]
  def change
    rename_column :accounts, :password_digest, :password_hash
    add_column :accounts, :password_salt, :string
  end
end
