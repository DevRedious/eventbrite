class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event
  has_many :administered_events, class_name: "Event", foreign_key: :user_id, dependent: :destroy

  # Validations optionnelles (email/password gérés par Devise plus tard)
  validates :first_name, :last_name, presence: true, allow_blank: true
  validates :description, length: { maximum: 500 }, allow_blank: true
  after_create :welcome_send
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end