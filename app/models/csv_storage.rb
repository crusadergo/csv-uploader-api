class CsvStorage < ApplicationRecord
    validates :title, presence: true
end
