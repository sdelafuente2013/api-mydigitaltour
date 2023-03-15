# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tour, type: :model do
  subject(:tour) { build(:tour) }
  subject(:tour_with_nil) { build(:tour, :with_nil) }
  subject(:tour_with_blank) { build(:tour, :with_blank) }

  describe 'Tour associations and behavior' do
    describe 'User association' do
      it 'associates a tour with a user' do
        user = create(:user)
        tour = create(:tour, user: user)

        expect(tour.user).to eq(user)
      end
    end

    describe 'Stages associations and behavior' do
      context 'when a tour has many stages' do
        it 'establishes a has_many relationship with stages' do
          tour = Tour.reflect_on_association(:stages)
          expect(tour.macro).to eq(:has_many)
        end

        it 'can have multiple stages associated with it' do
          user = create(:user)
          tour = create(:tour, user: user)
          create_list(:stage, 3, tour: tour)

          expect(tour.stages.count).to be > 1
        end

        it 'deletes all associated stages when the tour is deleted' do
          user = create(:user)
          tour = create(:tour, user: user)
          stage = create(:stage, tour: tour)

          tour.destroy

          expect { Stage.find(stage.id) }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end

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
end
