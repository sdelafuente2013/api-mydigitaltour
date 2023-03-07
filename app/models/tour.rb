# frozen_string_literal: true

class Tour < ApplicationRecord
  belongs_to :user
  has_many :stages

  # validations

end
