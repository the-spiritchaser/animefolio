require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with complete form' do
        expect(build(:user)).to be_valid
      end

      it 'is valid without profile' do
        expect(build(:user, profile: nil))
      end
    end
    context 'can not save' do
      it 'is invalid without name' do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it 'is invalid with not unipue name' do
        user = create(:user)
        another_user = build(:user, name: user.name, email: "another@mail.com")
        another_user.valid?
        expect(another_user.errors[:name]).to include("has already been taken")
      end

      it 'is invalid without email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid with not unipue email' do
        user = create(:user)
        another_user = build(:user, email: user.email, name: "another")
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it 'is invalid without password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      
      it 'is invalid without password_confirmation' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
    context 'boundary test' do
      it 'is invalid with password length under 7' do
        user = build(:user, password: "1234567")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
      end
      it 'is invalid with password length over 33' do
        user = build(:user, password: "123456789012345678901234567890123")
        user.valid?
        expect(user.errors[:password]).to include("is too long (maximum is 32 characters)")
      end
    end
  end
end