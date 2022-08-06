class Device < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:device_identity]
  belongs_to :user
  before_save :set_access_token

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def set_access_token
    self.device_identity = generate_and_save_identity
  end

  def self.pass
    1234567
  end

  def generate_and_save_identity
    loop do
      token =  /^[a-zA-Z0-9]{6,}$/.random_example

      break token unless Device.where(device_identity: token).exists?
    end
  end
end
