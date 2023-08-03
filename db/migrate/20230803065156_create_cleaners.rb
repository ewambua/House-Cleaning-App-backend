class CreateCleaners < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaners do |t|
      t.name :string
      t.username :string
      t.password_digest :string
      t.email :string
      t.description :text
      t.boolean :is_cleaner

      t.timestamps
    end
  end
end
