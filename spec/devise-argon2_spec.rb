# encoding: utf-8
require 'spec_helper'

describe Devise::Encryptable::Encryptors::Argon2 do
  let(:argon2)    { Devise::Encryptable::Encryptors::Argon2 }
  let(:password)  { 'Tr0ub4dor&3' }

  describe "used with pepper" do
    let(:pepper)    { "I don't really want to stop the show But I thought that you might like to know That the singer's going to sing a song And he wants you all to sing along" }

    describe ".compare" do
      let(:encrypted) { Argon2::Password.create(password, secret: pepper).to_s }

      it "is true when the encrypted password contains the argon2id format" do
        expect(encrypted).to match /argon2id/
      end

      it "is true when comparing an encrypted password against given plaintext" do
        expect(argon2.compare(encrypted_password: encrypted, password: password, secret: pepper)).to be true
      end

      it "is false when comparing with wrong password" do
        expect(argon2.compare(encrypted_password: encrypted, password: 'hunter2', secret: pepper)).to be false
      end

      it "is false when comparing with correct password but wrong pepper" do
        expect(argon2.compare(encrypted_password: encrypted, password: password, secret: 'beatles')).to be false
      end
    end

    describe "without any pepper" do
      let(:encrypted) { Argon2::Password.create(password).to_s }
      let(:pepper) { nil }

      it "is still works" do
        expect(argon2.compare(encrypted_password: encrypted, password: password)).to be true
      end
    end

  end

end
