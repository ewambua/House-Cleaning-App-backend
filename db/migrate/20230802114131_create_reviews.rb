class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.text :review
      t.references :user, foreign_key: true
      t.references :cleaner, foreign_key: true

      t.timestamps
    end
  end
end
