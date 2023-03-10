require 'rails_helper'

RSpec.describe Tour, type: :model do
  subject(:tour) { build(:tour) }
  subject(:tour_with_nil) { build(:tour_with_nil) }
  subject(:tour_with_blank) { build(:tour_with_blank) }

  describe 'title' do
    context 'when title is present' do
      it 'should be valid' do
        expect(tour).to validate_presence_of(:title)
      end

      it 'should not be valid with numbers or special characters' do
        expect(tour).to_not allow_value('John Doe 123').for(:title).with_message('only allows letters')
        expect(tour).to_not allow_value('John123').for(:title).with_message('only allows letters')
        expect(tour).to_not allow_value('John-Doe').for(:title).with_message('only allows letters')
      end

      it 'should has a length between 3 and 20 characters' do
        expect(tour).to validate_length_of(:title).is_at_least(3).is_at_most(20)
      end
    end

    context 'when title is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(tour_with_blank).not_to be_valid
        expect(tour_with_blank.errors.messages[:title]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(tour_with_nil).not_to be_valid
        expect(tour_with_nil.errors.messages[:title]).to include("can't be nil")
      end
    end
  end
end
