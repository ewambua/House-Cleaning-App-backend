class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.references :cleaner, foreign_key: true

      t.timestamps
    end
  end
end
