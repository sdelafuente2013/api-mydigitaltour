# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stage, type: :model do
    # subject(:user) { build(:user) }
    subject(:stage) { build(:stage) }
    subject(:stage_with_blank) { build(:stage_with_blank) }
    subject(:stage_with_nil) { build(:stage_with_nil) }
    subject(:stage_without_tour) { build(:stage, tour_id: nil) }

    # checking relationship between tour snd stages -> 1 a * (muchos)
    describe 'checking relations between Tour and Stage' do
      it 'is valid' do
        expect(stage).to belong_to(:tour)
      end

      it 'does not allow a stage to be created without a tour' do
        expect(stage_without_tour).to_not be_valid
      end

      # it 'deletes associated stage when tour is deleted' do
      #   user = create(:user_with_tours)
      #   puts user.inspect
      #
      #   # description_example = 'Lorem ipsum dolor18915615616 sit amet consectetur adipisicing elit. Ut adipisci, quo explicabo animi reiciendis ab dignissimos! Labore sapiente eum possimus ipsa deleniti? Asperiores vero repellat placeat animi saepe deserunt perspiciatis alias quibusdam a quae corrupti magnam et voluptas, exercitationem minima facere accusantium, vitae voluptates harum deleniti repellendus! Repudiandae incidunt placeat quis ad, exercitationem reprehenderit mollitia quasi nostrum maxime libero. Rerum quasi eaque eum. Magni possimus mollitia ducimus maiores dolorem, deleniti hic ea iure, consequuntur iste repellendus sequi labore odio ut obcaecati dignissimos, modi officiis! Quasi officiis voluptatibus maiores a ipsa quae dignissimos laborum tempora earum quisquam, ullam assumenda, culpa ducimus placeat voluptatem praesentium cupiditate aspernatur sint laboriosam aperiam consequuntur facilis! Sit architecto quos quod doloremque, corrupti pariatur quasi, aspernatur adipisci minima beatae officia aperiam quia placeat doloribus distinctio perspiciatis nesciunt molestiae laborum error excepturi itaque voluptas corporis. Veniam veritatis non minima vero commodi alias, voluptatum hic consequuntur asperiores! Necessitatibus, officiis!asdasdas'
      #   # tour = user.tours.first
      #   # stage = create(:stage, tour: tour, title: 'Stage', description: description_example, location: 1)
      #
      #   # expect { tour.destroy }.to change { Stage.count }.by(-1)
      # end

    end

    # describe 'There must be a User and a Tour to create stage' do
    #   it 'is valid with a user and a tour' do
    #     stage = build(:stage, user: user, tour: tour)
    #     expect(stage).to be_valid
    #   end
    #   it 'is invalid without a user' do
    #     stage = build(:stage, tour: tour)
    #     expect(stage).not_to be_valid
    #     expect(stage.errors[:user]).to include("can't be blank")
    #   end
    #
    #   it 'is invalid without a tour' do
    #     stage = build(:stage, user: user)
    #     expect(stage).not_to be_valid
    #     expect(stage.errors[:tour]).to include("can't be blank")
    #   end
    # end

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
