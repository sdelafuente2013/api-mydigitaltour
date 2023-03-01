# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'requires attributes obligatory' do
    it 'validates attributes is required' do
      should validate_presence_of(:name)
      should validate_presence_of(:lastname)
      should validate_presence_of(:email)
      should validate_presence_of(:role)
      should validate_presence_of(:status)
    end

    it 'name allow letters' do
      should allow_value('John').for(:name)
      should_not allow_value('John123').for(:name).with_message('only allows letters')
    end
  end
end
