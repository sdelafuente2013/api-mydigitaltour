# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'name' do
    context 'when name is present' do
      it 'should be valid' do
        should validate_presence_of(:name)
      end
    end

    context 'when name is not present' do
      context 'when name is nil' do
        let(:user) { User.new(name: nil) }

        it 'should be not valid' do
          expect(user).not_to be_valid
        end

        it 'adds an error message for the name nil attribute' do
          user.valid?
          expect(user.errors.messages[:name]).to include("can't be nil")
        end
      end

      context 'when name is blank' do
        let(:user) { User.new(name: '') }

        it 'should be not valid' do
          expect(user).not_to be_valid
        end

        it 'adds an error message for the name blank attribute' do
          user.valid?
          expect(user.errors.messages[:name]).to include("can't be blank")
        end
      end
    end

    context 'when name contains only letters' do
      it 'should be valid' do
        should allow_value('John').for(:name)
      end

      it 'adds an error message for the name attribute that does not contain only letters' do
        should_not allow_value('John123').for(:name).with_message('only allows letters')
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
