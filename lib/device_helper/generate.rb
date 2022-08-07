module Generate

  def self.generate_identity
    loop do
      identity = Constants::IDENTITY.random_example

      break identity unless Device.where(device_identity: identity).exists?
    end
  end

  def self.generate_password
   Constants::PASSWORD.random_example
  end
end


