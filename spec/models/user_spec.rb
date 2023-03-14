# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }
  subject(:user_created) { create(:user, status: true) }
  subject(:user_with_nil) { build(:user, :with_nil) }
  subject(:user_with_blank) { build(:user, :with_blank) }
  subject(:user_invalid_mail) { build(:user, :invalid_mail) }

  describe 'User associations' do
    context 'when a user has many tours' do
      it 'has a has_many relationship with tours' do
        user = User.reflect_on_association(:tours)
        expect(user.macro).to eq(:has_many)
      end

      it 'can have multiple associated tours' do
        puts user_created.inspect
        create_list(:tour, 3, user: user_created)
        expect(user_created.tours.count).to be > 1
      end
    end
  end

  describe 'name' do
    context 'when name is present' do
      it 'should be valid' do
        expect(user).to validate_presence_of(:name)
      end

      it 'should not be valid with numbers or special characters' do
        expect(user).to_not allow_value('John Doe 123').for(:name).with_message('only allows letters')
        expect(user).to_not allow_value('John123').for(:name).with_message('only allows letters')
        expect(user).to_not allow_value('John-Doe').for(:name).with_message('only allows letters')
      end

      it 'should has a length between 3 and 20 characters' do
        expect(user).to validate_length_of(:name).is_at_least(3).is_at_most(20)
      end
    end

    context 'when name is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(user_with_blank).not_to be_valid
        expect(user_with_blank.errors.messages[:name]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(user_with_nil).not_to be_valid
        expect(user_with_nil.errors.messages[:name]).to include("can't be nil")
      end
    end
  end

  describe 'lastname' do
    context 'when lastname is present' do
      it 'should be valid' do
        expect(user).to validate_presence_of(:lastname)
      end

      it 'should not be valid with numbers or special characters' do
        expect(user).to_not allow_value('J0hn').for(:lastname).with_message('only allows letters')
        expect(user).to_not allow_value('John123').for(:lastname).with_message('only allows letters')
        expect(user).to_not allow_value('John!').for(:lastname).with_message('only allows letters')
      end

      it 'should allows only letter characters' do
        expect(user).to allow_value('John').for(:lastname)
      end

      it 'should has a minimum length of 3 characters max 20' do
        expect(user).to validate_length_of(:lastname).is_at_least(3).is_at_most(20)
      end
    end

    context 'when lastname is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(user_with_blank).not_to be_valid
        expect(user_with_blank.errors.messages[:lastname]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(user_with_nil).not_to be_valid
        expect(user_with_nil.errors.messages[:lastname]).to include("can't be nil")
      end
    end
  end

  describe 'role' do
    context 'when role is present' do
      it 'should be valid' do
        expect(user).to validate_presence_of(:role)
      end

      it 'should contain only 3 possible roles (admin, user, guide)' do
        expect(user).to validate_inclusion_of(:role).in_array(%w[user guia admin])
      end
    end

    context 'when role is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(user_with_blank).not_to be_valid
        expect(user_with_blank.errors.messages[:role]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(user_with_nil).not_to be_valid
        expect(user_with_nil.errors.messages[:role]).to include("can't be nil")
      end
    end
  end

  describe 'email' do
    context 'when email is present' do
      it 'should be valid' do
        expect(user).to validate_presence_of(:email)
      end

      it 'should be unique' do
        expect(user).to validate_uniqueness_of(:email).case_insensitive
      end

      it 'should not be valid with invalid mail' do
        expect(user_invalid_mail).not_to be_valid
      end

      it 'should adds an error message for the email invalid attribute' do
        user_invalid_mail.valid?
        expect(user_invalid_mail.errors.messages[:email]).to include('is invalid')
      end
    end

    context 'when email is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(user_with_blank).not_to be_valid
        expect(user_with_blank.errors.messages[:email]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(user_with_nil).not_to be_valid
        expect(user_with_nil.errors.messages[:email]).to include("can't be nil")
      end
    end
  end

  describe 'status' do
    context 'when status is present' do
      it 'should be valid' do
        expect(user).to be_valid
      end
    end

    context 'when status is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(user_with_blank).not_to be_valid
      end

      it 'should not be valid if is nil' do
        expect(user_with_nil).not_to be_valid
        expect(user_with_nil.errors.messages[:status]).to include("can't be nil")
      end
    end
  end
end
