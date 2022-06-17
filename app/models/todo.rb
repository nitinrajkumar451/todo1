class Todo < ApplicationRecord
    enum status: [:completed, :pending, :deprecated]
    validates :title,  presence: true

end
