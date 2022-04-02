# frozen_string_literal: true

# class Todo: title, description, done, schedule
class Todo < ApplicationRecord
  validates :title, presence: true
  validates :schedule, presence: true
  validate :schedule_greater_than_today

  private

  def schedule_greater_than_today
    return if schedule.blank?

    errors.add(:schedule, 'must be greater than today') if schedule < DateTime.current.beginning_of_day
  end
end
