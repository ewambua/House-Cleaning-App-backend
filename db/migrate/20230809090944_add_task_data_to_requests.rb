class AddTaskDataToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :task_data, :json
  end
end
