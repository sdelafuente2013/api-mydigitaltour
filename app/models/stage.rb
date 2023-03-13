# frozen_string_literal: true

class Stage < ApplicationRecord
  belongs_to :tour

  # validates :tour_id, presence: true
  validates :location, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 30 }, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :description, presence: true, length: { minimum: 150, maximum: 2000 }
  validate :attributes_not_nil

  def attributes_not_nil
    [:title, :description, :tour, :location].each do |attr|
      if self[attr].nil?
        errors.add(attr, "can't be nil")
      end
    end
  end
end
