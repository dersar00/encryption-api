class CreateEncryptedFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :encrypted_files do |t|
      t.string :file
      t.text :file
      t.string :file_name
      t.string :file_hash
      t.string :user_email
      t.integer :user_id

      t.timestamps
    end

    add_index :encrypted_files, :user_id
  end
end
