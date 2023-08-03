class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.response :boolean
      t.user :id
      t.cleaner :id

      t.timestamps
    end
  end
end
