class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.name :string
      t.username :string
      t.password_digest :string
      t.email :string
      t.description :text
      t.boolean :is_admin

      t.timestamps
    end
  end
end
