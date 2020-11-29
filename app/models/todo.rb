class Todo < ApplicationRecord
  belongs_to :project

  validates :title, presence: true,
                    length: { minimum: 4 }
end
