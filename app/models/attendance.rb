class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  # Optionnel : unicité user + event
  validates :event_id, uniqueness: { scope: :user_id, message: "déjà rejoint" }
  after_create :notify_organizer

  def notify_organizer
    UserMailer.new_attendance_email(self).deliver_now
  end
end
