class CreateCsvStorages < ActiveRecord::Migration[6.1]
  def change
    create_table :csv_storages do |t|
      t.binary :file, limit: 10.megabyte

      t.timestamps
    end
  end
end
