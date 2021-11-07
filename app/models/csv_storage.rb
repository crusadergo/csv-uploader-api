class CsvStorage < ApplicationRecord
    mount_uploader :file, CsvStorageUploader

    attr_accessor :filename

    def filename
        self.file.identifier
    end


    validates :title, presence: true
end
