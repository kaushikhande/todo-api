class Todo < ApplicationRecord
  validates :title, presence: true
  validates :schedule, presence: true
end
