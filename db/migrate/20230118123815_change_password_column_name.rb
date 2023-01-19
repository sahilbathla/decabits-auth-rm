class ChangePasswordColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :accounts, :encrypted_password, :password_digest
  end
end
