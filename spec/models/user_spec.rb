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

        it 'adds an error message for the name nil attribute' do
          user.valid?
          expect(user.errors.messages[:role]).to include("can't be nil")
        end
      end

      context 'when role is blank' do
        let(:user) { User.new(role: '') }

        it 'should be not valid' do
          expect(user).not_to be_valid
        end

        it 'adds an error message for the name blank attribute' do
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

  # context 'when attributes is present' do
  #   it 'should be valid' do
  #     should validate_presence_of(:name)
  #     should validate_presence_of(:lastname)
  #     should validate_presence_of(:email)
  #     should validate_presence_of(:role)
  #     should validate_presence_of(:status)
  #   end
  # end
  #
  # context 'when attributes is not present' do
  #   it 'should be not valid' do
  #     should validate_absence_of(:name)
  #     should validate_absence_of(:lastname)
  #     should validate_absence_of(:email)
  #     should validate_absence_of(:role)
  #     should validate_absence_of(:status)
  #   end
  # end

    # it 'name allow letters' do
    #   should allow_value('John').for(:name)
    #   should_not allow_value('John123').for(:name).with_message('only allows letters')
    # end
end
