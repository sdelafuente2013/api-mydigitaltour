require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe 'validates presence' do
    it 'should validate name' do
      expect(Movie.new).to have_attribute(:name)
    end

    it 'should validate rating' do
      expect(Movie.new).to have_attribute(:rating)
    end
  end

  describe 'requires attributes obligatory' do

    it 'name is required' do
      should validate_presence_of(:name)
    end

    it 'rating is required' do
      should validate_presence_of(:rating)
    end

    it 'name allow letters' do
      should allow_value('John').for(:name)
      should_not allow_value('John123').for(:name).with_message('only allows letters')
    end

  end
end
