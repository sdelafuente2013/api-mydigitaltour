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

      it 'should be not valid if it is null' do
        expect(user_nil).not_to be_valid
      end

      it 'should adds an error message for the name nil attribute' do
        user_nil.valid?
        expect(user_nil.errors.messages[:name]).to include("can't be nil")
      end

      it 'should be not valid if it is blank' do
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

      it 'should be not valid if it is null' do
        expect(user_nil).not_to be_valid
      end

      it 'should adds an error message for the lastname nil attribute' do
        user_nil.valid?
        expect(user_nil.errors.messages[:lastname]).to include("can't be nil")
      end

      it 'should be not valid if it is blank' do
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
    end

    context 'when role is not present' do
      context 'when role is nil' do
        let(:user) { User.new(role: nil) }

        it 'should be not valid' do
          expect(user).not_to be_valid
        end

        it 'adds an error message for the role nil attribute' do
          user.valid?
          expect(user.errors.messages[:role]).to include("can't be nil")
        end
      end

      context 'when role is blank' do
        let(:user) { User.new(role: '') }

        it 'should be not valid' do
          expect(user).not_to be_valid
        end

        it 'adds an error message for the role blank attribute' do
          user.valid?
          expect(user.errors.messages[:role]).to include("can't be blank")
        end
      end
    end

    context 'when the role contains only (user, guide and admin)' do
      it 'should be valid' do
        should validate_inclusion_of(:role).in_array(%w[user guia admin])
      end
    end
  end

  describe 'email' do
    context 'when email is present' do
      it 'should be valid' do
        should validate_presence_of(:email)
      end
    end

    context 'when email is not present' do
      context 'when email is nil' do
        let(:user) { User.new(email: nil) }

        it 'should be not valid' do
          expect(user).not_to be_valid
        end

        it 'adds an error message for the email nil attribute' do
          user.valid?
          expect(user.errors.messages[:email]).to include("can't be nil")
        end
      end
    end

    context 'when email is not unique' do
      it 'should be not valid' do
        should validate_uniqueness_of(:email)
      end
    end


    context 'when email format is invalid' do
      let(:user) { build(:user, email: 'invalid_email') }

      it 'should be not valid' do
        expect(user).not_to be_valid
      end

      it 'adds an error message for the email invalid attribute' do
        user.valid?
        expect(user.errors.messages[:email]).to include("is invalid")
      end
    end

    context 'when email format is valid' do
      let(:user) { build(:user, email: 'user@example.com') }

      it 'should be valid' do
        expect(user).to be_valid
      end
    end
  end

  describe 'status' do
    context 'when status is present' do
      it 'should be valid' do
        should validate_presence_of(:status)
      end
    end

    context 'when status is not present' do
      context 'when status is nil' do
        let(:user) { User.new(status: nil) }

        it 'should be not valid' do
          expect(user).not_to be_valid
        end

        it 'adds an error message for the status nil attribute' do
          user.valid?
          expect(user.errors.messages[:status]).to include("can't be nil")
        end
      end

      context 'when status is blank' do
        let(:user) { User.new(status: '') }

        it 'should be not valid' do
          expect(user).not_to be_valid
        end

        it 'adds an error message for the status blank attribute' do
          user.valid?
          expect(user.errors.messages[:status]).to include("can't be blank")
        end
      end
    end

    context 'when the status be only (true or false)' do
      it 'should be valid' do
        should validate_inclusion_of(:status).in_array([true, false])
      end
    end
  end
end
