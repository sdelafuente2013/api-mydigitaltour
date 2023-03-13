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
        expect(tour).to_not allow_value('Tour 123').for(:title).with_message('only allows letters')
        expect(tour).to_not allow_value('Tour123').for(:title).with_message('only allows letters')
        expect(tour).to_not allow_value('Tour-Doe').for(:title).with_message('only allows letters')
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

  describe 'country' do
    context 'when country is present' do
      it 'should be valid' do
        expect(tour).to validate_presence_of(:country)
      end

      it 'should not be valid with numbers or special characters' do
        expect(tour).to_not allow_value('Tour 123').for(:country).with_message('only allows letters')
        expect(tour).to_not allow_value('Tour123').for(:country).with_message('only allows letters')
        expect(tour).to_not allow_value('Tour-Doe').for(:country).with_message('only allows letters')
      end

      it 'should has a length between 3 and 20 characters' do
        expect(tour).to validate_length_of(:country).is_at_least(3).is_at_most(20)
      end
    end

    context 'when name is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(tour_with_blank).not_to be_valid
        expect(tour_with_blank.errors.messages[:country]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(tour_with_nil).not_to be_valid
        expect(tour_with_nil.errors.messages[:country]).to include("can't be nil")
      end
    end
  end

  describe 'city' do
    context 'when city is present' do
      it 'should be valid' do
        expect(tour).to validate_presence_of(:city)
      end

      it 'should not be valid with numbers or special characters' do
        expect(tour).to_not allow_value('Barcleona 123').for(:city).with_message('only allows letters')
        expect(tour).to_not allow_value('Barca123').for(:city).with_message('only allows letters')
      end

      it 'should has a length between 3 and 20 characters' do
        expect(tour).to validate_length_of(:city).is_at_least(3).is_at_most(20)
      end
    end

    context 'when name is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(tour_with_blank).not_to be_valid
        expect(tour_with_blank.errors.messages[:city]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(tour_with_nil).not_to be_valid
        expect(tour_with_nil.errors.messages[:city]).to include("can't be nil")
      end
    end
  end

  describe 'price' do
    context 'when price is present' do
      it 'should be valid' do
        expect(tour).to validate_presence_of(:price)
      end

      # it 'should has a length between 1 and 4 characters' do
      #   expect(tour).to validate_length_of(:price).is_at_least(1).is_at_most(4)
      # end
    end

    context 'when name is not present (blank or nil)' do
      it 'should not be valid if is blank' do
        expect(tour_with_blank).not_to be_valid
        expect(tour_with_blank.errors.messages[:price]).to include("can't be blank")
      end

      it 'should not be valid if is nil' do
        expect(tour_with_nil).not_to be_valid
        expect(tour_with_nil.errors.messages[:price]).to include("can't be nil")
      end
    end
  end

##faltan validaciones de actividad y user que tienen que ver con las relaiones

end
