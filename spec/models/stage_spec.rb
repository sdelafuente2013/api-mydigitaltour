require 'rails_helper'

RSpec.describe Stage, type: :model do
  describe 'title' do
    context 'when tile is present' do
      it 'should be valid' do
        expect(stage).to validate_presence_of(:title)
      end

      it 'should not be valid with numbers or special characters' do
        expect(stage).to_not allow_value('John Doe 123').for(:title).with_message('only allows letters')
        expect(stage).to_not allow_value('John123').for(:title).with_message('only allows letters')
        expect(stage).to_not allow_value('John-Doe').for(:title).with_message('only allows letters')
      end

      it 'should has a length between 15 and 100 characters' do
        expect(stage).to validate_length_of(:title).is_at_least(15).is_at_most(100)
      end
    end

    context 'when title is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(stage_with_blank).not_to be_valid
        expect(stage_with_blank.errors.messages[:title]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(stage_with_nil).not_to be_valid
        expect(stage_with_nil.errors.messages[:name]).to include("can't be nil")
      end
    end
  end

  describe 'description' do
    context 'when description is present' do
      it 'should be valid' do
        expect(stage).to validate_presence_of(:description)
      end

      it 'should not be valid with numbers or special characters' do
        expect(stage).to_not allow_value('John Doe 123').for(:description).with_message('only allows letters')
        expect(stage).to_not allow_value('John123').for(:description).with_message('only allows letters')
        expect(stage).to_not allow_value('John-Doe').for(:description).with_message('only allows letters')
      end

      it 'should has a length between 100 and 500 characters' do
        expect(stage).to validate_length_of(:description).is_at_least(100).is_at_most(500)
      end
    end

    context 'when description is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(stage_with_blank).not_to be_valid
        expect(stage_with_blank.errors.messages[:description]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(stage_with_nil).not_to be_valid
        expect(stage_with_nil.errors.messages[:description]).to include("can't be nil")
      end
    end
  end

  describe 'location' do
    context 'when location is present' do
      it 'should be valid' do
        expect(stage).to validate_presence_of(:location)
      end

      it 'should not be valid with strings' do
        expect(stage).to_not allow_value('John Doe 123').for(:location).with_message('only allows numbers')
        expect(stage).to_not allow_value('John123').for(:location).with_message('only allows numbers')
      end

      it 'should has a length between 15 and 100 characters' do
        expect(stage).to validate_length_of(:location).is_at_least(15).is_at_most(100)
      end
    end

    context 'when location is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(stage_with_blank).not_to be_valid
        expect(stage_with_blank.errors.messages[:location]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(stage_with_nil).not_to be_valid
        expect(stage_with_nil.errors.messages[:location]).to include("can't be nil")
      end
    end
  end

end
