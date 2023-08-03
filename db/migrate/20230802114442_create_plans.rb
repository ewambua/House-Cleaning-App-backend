class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string  :name
      t.integer :price
      t.string  :task_one
      t.string  :task_two
      t.string :task_three
      t.text :description

      t.timestamps
    end
  end
end
