require 'rails_helper'

RSpec.describe Tour, type: :model do

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
end
