class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable, :authentication_keys => [:username]

  has_many :devices

  validates :username, presence: true
  validates_uniqueness_of :username
  validates :username, format: { with: Constants::NAME_PATTERN }, length: { minimum: 4, maximum: 20 }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
