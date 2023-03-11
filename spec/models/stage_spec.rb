RSpec.describe Stage, type: :model do
  let(:stage) { build(:stage, user: user, tour: tour) }

    
    describe 'Checking Relations between Users and Tours' do
      it { should belong_to(:user) }
      it { should belong_to(:tour) }
    end
    
    describe 'There must be a User and a Tour to create stage' do
      it 'is valid with a user and a tour' do
        stage = build(:stage, user: user, tour: tour)
        expect(stage).to be_valid
      end
      it 'is invalid without a user' do
        stage = build(:stage, tour: tour)
        expect(stage).not_to be_valid
        expect(stage.errors[:user]).to include("can't be blank")
      end
      
      it 'is invalid without a tour' do
        stage = build(:stage, user: user)
        expect(stage).not_to be_valid
        expect(stage.errors[:tour]).to include("can't be blank")
      end
    end

    describe 'Title' do
        context 'when Title is present' do
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
      describe 'Location' do
        context 'when Location is present' do
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
