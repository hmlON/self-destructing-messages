class AddEncryptionKeyToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :encryption_key, :string
  end
end
