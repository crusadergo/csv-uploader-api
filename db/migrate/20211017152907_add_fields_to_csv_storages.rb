class AddFieldsToCsvStorages < ActiveRecord::Migration[6.1]
  def change
    add_column :csv_storages, :title, :string
  end
end
