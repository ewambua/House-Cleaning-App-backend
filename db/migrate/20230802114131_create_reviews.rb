class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.review :string
      t.user :id

      t.timestamps
    end
  end
end
