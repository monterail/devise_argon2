require 'argon2'

module Devise
  module Encryptable
    module Encryptors
      class Argon2 < Base
        def self.digest(password:, secret: nil)
          ::Argon2::Password.create(password, secret: secret)
        end

        def self.compare(encrypted_password:, password:, secret: nil)
          ::Argon2::Password.verify_password(password, encrypted_password, secret)
        end
      end
    end
  end
end
