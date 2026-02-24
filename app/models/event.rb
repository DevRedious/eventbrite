class Event < ApplicationRecord
  belongs_to :user  # administrateur / créateur
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  validates :start_date, presence: true
  validate :start_date_not_in_past
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :duration_multiple_of_5
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, in: 1..1000 }
  validates :location, presence: true

  def end_date
    start_date + duration.minutes
  end

  private

  def start_date_not_in_past
    return if start_date.blank?
    errors.add(:start_date, "ne peut pas être dans le passé") if start_date < Time.current
  end

  def duration_multiple_of_5
    return if duration.blank?
    errors.add(:duration, "doit être un multiple de 5") if duration % 5 != 0
  end
end
