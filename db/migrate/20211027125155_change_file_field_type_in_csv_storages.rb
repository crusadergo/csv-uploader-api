class ChangeFileFieldTypeInCsvStorages < ActiveRecord::Migration[6.1]
  def change
    change_column :csv_storages, :file, :string
  end
end
