# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stage, type: :model do
    subject(:stage) { build(:stage) }
    subject(:stage_with_blank) { build(:stage, :with_blank) }
    subject(:stage_with_nil) { build(:stage, :with_nil) }
    subject(:stage_without_tour) { build(:stage, tour_id: nil) }

    describe 'Stage associations and behavior' do
      describe 'Tour association' do
        it 'belongs to a tour' do
          stage_association = Stage.reflect_on_association(:tour)
          expect(stage_association.macro).to eq(:belongs_to)
        end

        it 'associates a stage with a tour' do
          user = create(:user)
          tour = create(:tour, user: user)
          stage = create(:stage, tour: tour)

          expect(stage.tour).to eq(tour)
        end
      end
    end

    describe 'title' do
        context 'when title is present' do
          it 'should be valid' do
            expect(stage).to validate_presence_of(:title)
          end

          it 'should not be valid with numbers or special characters' do
            expect(stage).to_not allow_value('John Doe 123').for(:title).with_message('only allows letters')
            expect(stage).to_not allow_value('John123').for(:title).with_message('only allows letters')
            expect(stage).to_not allow_value('John-Doe').for(:title).with_message('only allows letters')
          end

          it 'should has a length between 5 and 30 characters' do
            expect(stage).to validate_length_of(:title).is_at_least(5).is_at_most(30)
          end
        end

        context 'when title is not present (blank or nil)' do
          it 'should not be valid if is blank' do
            expect(stage_with_blank).not_to be_valid
            expect(stage_with_blank.errors.messages[:title]).to include("can't be blank")
          end

          it 'should not be valid if is nil' do
            expect(stage_with_nil).not_to be_valid
            expect(stage_with_nil.errors.messages[:title]).to include("can't be nil")
          end
        end
      end

    describe 'description' do
      context 'when description is present' do
        it 'should be valid' do
          expect(stage).to validate_presence_of(:description)
        end

        it 'should has a minimum length of 150 characters max 2000' do
          expect(stage).to validate_length_of(:description).is_at_least(150).is_at_most(2000)
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

        context 'when description is not present (blank or nil)' do
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
  end
