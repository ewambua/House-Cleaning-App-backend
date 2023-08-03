class CreateCleaners < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaners do |t|
      t.string :name
      t.string :email
      t.text   :description
      t.string :password_digest

      t.timestamps
    end
  end
end
