class CreateAuthenticationTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :authentication_tokens do |t|
      t.string :body
      t.datetime :last_used_at
      t.integer :expires_in
      t.string :ip_address
      t.string :user_agent
      t.integer :user_id

      t.timestamps
    end
    add_index :authentication_tokens, :body
    add_index :authentication_tokens, :user_id
  end
end
