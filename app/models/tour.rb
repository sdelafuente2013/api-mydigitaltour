# frozen_string_literal: true

class Tour < ApplicationRecord
  belongs_to :user
  has_many :stages

  validates :title, :country, :city, :price, presence: true
  validates :title, :country, :city, format: { with: /\A[a-zA-Z\s]+\z/, message: 'only allows letters' }
  validates_length_of :title, :country, :city, in: 3..20
  validates_length_of :price, in: 1..4
  validate :attributes_not_nil

  # validations
  def attributes_not_nil
    [:name, :role, :status, :email, :lastname].each do |attr|
      if self[attr].nil?
        errors.add(attr, "can't be nil")
      end
    end
  end

end
