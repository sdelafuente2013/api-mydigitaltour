# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'name' do
    context 'when name is present' do

      it 'should be valid' do
        should validate_presence_of(:name)
      end

      it 'should be valid with only letters' do
        should allow_value('John').for(:name)
      end

      it 'should adds an error message for the name attribute that does not contain only letters' do
        should_not allow_value('John123').for(:name).with_message('only allows letters')
      end

      it 'should has a minimum length of 3 characters max 15' do
        should ensure_length_of(:name).is_at_least(3).is_at_most(15)
      end
    end

    context 'when name is not present' do
      let(:user_nil) { User.new(name: nil) }
      let(:user_blank) { User.new(name: '') }

      it 'should not be valid if it is nil' do
        expect(user_nil).not_to be_valid
      end

      it 'should adds an error message for the name nil attribute' do
        user_nil.valid?
        expect(user_nil.errors.messages[:name]).to include("can't be nil")
      end

      it 'should not be valid if it is blank' do
        expect(user_blank).not_to be_valid
      end

      it 'should adds an error message for the name blank attribute' do
        user_blank.valid?
        expect(user_blank.errors.messages[:name]).to include("can't be blank")
      end
    end
  end


  describe 'lastname' do
    context 'when lastname is present' do
      it 'should be valid' do
        should validate_presence_of(:lastname)
      end

      it 'should does not allow non-letter characters' do
        should_not allow_value('John123').for(:lastname)
      end

      it 'should allows only letter characters' do
        should allow_value('John').for(:lastname)
      end

      it 'should has a minimum length of 3 characters max 15' do
        should ensure_length_of(:lastname).is_at_least(3).is_at_most(15)
      end
    end

    context 'when lastname is not present' do
      let(:user_nil) { User.new(lastname: nil) }
      let(:user_blank) { User.new(lastname: '') }

      it 'should not be valid if it is nil' do
        expect(user_nil).not_to be_valid
      end

      it 'should adds an error message for the lastname nil attribute' do
        user_nil.valid?
        expect(user_nil.errors.messages[:lastname]).to include("can't be nil")
      end

      it 'should not be valid if it is blank' do
        expect(user_blank).not_to be_valid
      end

      it 'should adds an error message for the lastname blank attribute' do
        user_blank.valid?
        expect(user_blank.errors.messages[:lastname]).to include("can't be blank")
      end
    end
  end

  describe 'role' do
    context 'when role is present' do
      it 'should be valid' do
        should validate_presence_of(:role)
      end

      it 'should contain only 3 possible roles (admin, user, guide)' do
        should validate_inclusion_of(:role).in_array(%w[user guia admin])
      end
    end

    context 'when role is not present' do
      let(:user_nil) { User.new(role: nil) }
      let(:user_blank) { User.new(role: '') }

      it 'should not be valid if it is nil' do
        expect(user_nil).not_to be_valid
      end

      it 'should adds an error message for the role nil attribute' do
        user_nil.valid?
        expect(user_nil.errors.messages[:role]).to include("can't be nil")
      end

      it 'should not be valid if it is blank' do
        expect(user_blank).not_to be_valid
      end

      it 'should adds an error message for the role blank attribute' do
        user_blank.valid?
        expect(user_blank.errors.messages[:role]).to include("can't be blank")
      end
    end
  end

  describe 'email' do
    context 'when email is present' do
      let(:user_invalid_mail) { build(:user, email: 'invalid_email') }
      let(:user_valid_mail) { build(:user, email: 'user@example.com') }

      it 'should be valid' do
        should validate_presence_of(:email)
      end

      it 'should be unique' do
        should validate_uniqueness_of(:email)
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

    context 'when email is not present' do
      let(:user_nil) { User.new(email: nil) }
      let(:user_blank) { User.new(email: '') }

      it 'should not be valid if it is nil' do
        expect(user_nil).not_to be_valid
      end

      it 'should adds an error message for the email nil attribute' do
        user_nil.valid?
        expect(user_nil.errors.messages[:email]).to include("can't be nil")
      end

      it 'should not be valid if it is blank' do
        expect(user_blank).not_to be_valid
      end

      it 'should adds an error message for the email blank attribute' do
        user_blank.valid?
        expect(user_blank.errors.messages[:email]).to include("can't be blank")
      end
    end
  end

  describe 'status' do
    context 'when status is present' do
      it 'should be valid' do
        should validate_presence_of(:status)
      end

      it 'should contain only 2 possible status (true or false)' do
        should validate_inclusion_of(:status).in_array([true, false])
      end
    end

    context 'when status is not present' do
      let(:user_nil) { User.new(status: nil) }
      let(:user_blank) { User.new(status: '') }

      it 'should not be valid if it is nil' do
        expect(user_nil).not_to be_valid
      end

      it 'should adds an error message for the status nil attribute' do
        user_nil.valid?
        expect(user_nil.errors.messages[:status]).to include("can't be nil")
      end

      it 'should not be valid if it is blank' do
        expect(user_blank).not_to be_valid
      end

      it 'should adds an error message for the status blank attribute' do
        user_blank.valid?
        expect(user_blank.errors.messages[:status]).to include("can't be blank")
      end
    end
  end
end
