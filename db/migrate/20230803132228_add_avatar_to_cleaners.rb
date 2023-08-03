class AddAvatarToCleaners < ActiveRecord::Migration[6.1]
  def change
    add_column :cleaners, :image_url, :string
  end
end
