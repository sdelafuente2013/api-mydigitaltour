# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'name' do
    context 'when name is present' do
      subject(:user) { build(:user) }

      it 'should be valid' do
        expect(user).to validate_presence_of(:name)
      end

      it 'should be valid with only letters' do
        expect(user).to allow_value('John').for(:name)
      end

      it 'should not be valid with numbers or special characters' do
        expect(user).to_not allow_value('J0hn').for(:name).with_message('only allows letters')
        expect(user).to_not allow_value('John123').for(:name).with_message('only allows letters')
        expect(user).to_not allow_value('John!').for(:name).with_message('only allows letters')
      end

      it 'should has a length between 3 and 15 characters' do
        expect(user).to validate_length_of(:name).is_at_least(3).is_at_most(15)
      end
    end

    context 'when name is not present (blank or nil)' do
      subject(:user_with_blank_name) { build(:user, name: '') }
      subject(:user_with_nil_name) { build(:user, name: nil) }

      it 'should not be valid if is blank' do
        expect(user_with_blank_name).not_to be_valid
        expect(user_with_blank_name.errors.messages[:name]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(user_with_nil_name).not_to be_valid
        expect(user_with_nil_name.errors.messages[:name]).to include("can't be nil")
      end
    end
  end

  describe 'lastname' do
    context 'when lastname is present' do
      subject(:user) { build(:user) }

      it 'should be valid' do
        expect(user).to validate_presence_of(:lastname)
      end

      it 'should not be valid with numbers or special characters' do
        expect(user).to_not allow_value('J0hn').for(:name).with_message('only allows letters')
        expect(user).to_not allow_value('John123').for(:name).with_message('only allows letters')
        expect(user).to_not allow_value('John!').for(:name).with_message('only allows letters')
      end

      it 'should allows only letter characters' do
        expect(user).to allow_value('John').for(:lastname)
      end

      it 'should has a minimum length of 3 characters max 15' do
        expect(user).to validate_length_of(:lastname).is_at_least(3).is_at_most(15)
      end
    end

    context 'when lastname is not present (blank or nil)' do
      let(:user_with_nil_name) { build(:user, lastname: nil) }
      let(:user_with_blank_name) { build(:user, lastname: '') }

      it 'should not be valid if is blank' do
        expect(user_with_blank_name).not_to be_valid
        expect(user_with_blank_name.errors.messages[:lastname]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(user_with_nil_name).not_to be_valid
        expect(user_with_nil_name.errors.messages[:lastname]).to include("can't be nil")
      end
    end
  end

  describe 'role' do
    context 'when role is present' do
      subject(:user) { build(:user) }

      it 'should be valid' do
        expect(subject).to validate_presence_of(:role)
      end

      it 'should contain only 3 possible roles (admin, user, guide)' do
        expect(subject).to validate_inclusion_of(:role).in_array(%w[user guia admin])
      end
    end

    context 'when role is not present (blank or nil)' do
      let(:user_with_nil_name) { build(:user, role: nil) }
      let(:user_with_blank_name) { build(:user, role: '') }

      it 'should not be valid if is blank' do
        expect(user_with_blank_name).not_to be_valid
        expect(user_with_blank_name.errors.messages[:role]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(user_with_nil_name).not_to be_valid
        expect(user_with_nil_name.errors.messages[:role]).to include("can't be nil")
      end
    end
  end

  describe 'email' do
    context 'when email is present' do
      let(:user_invalid_mail) { build(:user, email: 'invalid_email') }
      let(:user_valid_mail) { build(:user, email: 'user@example.com') }

      it 'should be valid' do
        expect(user_valid_mail).to validate_presence_of(:email)
      end

      it 'should be unique' do
        expect(user_valid_mail).to validate_uniqueness_of(:email)
      end

      it 'should be valid with valid mail' do
        expect(user_valid_mail).to be_valid
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
      let(:user_nil) { build_stubbed(:user, email: nil) }
      let(:user_blank) { build_stubbed(:user, email: '') }

      it 'should not is valid' do
        expect(user_nil).not_to be_valid
        expect(user_blank).not_to be_valid
      end

      it 'should adds an error message for the email is nil' do
        user_nil.valid?
        expect(user_nil.errors.messages[:email]).to include("can't be nil")
      end

      it 'should adds an error message for the email is blank' do
        user_blank.valid?
        expect(user_blank.errors.messages[:email]).to include("can't be blank")
      end
    end
  end

  describe 'status' do
    context 'when status is present' do
      subject(:user) { build(:user) }

      it 'should be valid' do
        expect(user).to validate_presence_of(:status)
      end

      it 'should contain only 2 possible status (true or false)' do
        expect(user).to validate_inclusion_of(:status).in_array([true, false])
      end
    end

    context 'when status is not present (blank or nil)' do
      let(:user_nil) { build_stubbed(:user, status: nil) }
      let(:user_blank) { build_stubbed(:user, status: '') }

      it 'should not be valid' do
        expect(user_nil).not_to be_valid
        expect(user_blank).not_to be_valid
      end

      it 'should adds an error message for the status is nil' do
        user_nil.valid?
        expect(user_nil.errors.messages[:status]).to include("can't be nil")
      end

      it 'should adds an error message for the status is blank' do
        user_blank.valid?
        expect(user_blank.errors.messages[:status]).to include("can't be blank")
      end
    end
  end
end
