class CreateCleaners < ActiveRecord::Migration[6.1]
  def change
    create_table :cleaners do |t|
      t.string :name
      t.string :email
      t.text   :description
      t.string :password_digest
      cleaners, :image_url, :string

      t.timestamps
    end
  end
end
