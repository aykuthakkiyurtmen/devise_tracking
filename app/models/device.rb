class Device < ApplicationRecord

  devise :database_authenticatable,
         :rememberable, :validatable, :authentication_keys => [:device_identity]

  belongs_to :user
  before_create :set_identity

  validates :name, length: { minimum: 4, maximum: 20 }, presence:true
  validates_format_of :name, :with => Constants::NAME_PATTERN

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def set_identity
    self.device_identity = Generate::generate_identity
  end

  def set_password
    Generate::generate_password
  end
end
