class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.name :string
      t.details :text
      t.price :integer
      t.cleaner :id

      t.timestamps
    end
  end
end
