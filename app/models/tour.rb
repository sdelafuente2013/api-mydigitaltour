# frozen_string_literal: true

class Tour < ApplicationRecord
  # validations
  validates :title, presence: true, length: { minimum: 3, maximum: 20 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validate :attributes_not_nil

  belongs_to :user
  has_many :stages

  def attributes_not_nil
    [:title, :country, :city, :type_activity, :price].each do |attr|
      if self[attr].nil?
        errors.add(attr, "can't be nil")
      end
    end
  end
end
