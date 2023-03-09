# frozen_string_literal: true

class Stage < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :title, :description, :location, presence: true
  validates :title, :description, format: { with: /\A[a-zA-Z\s]+\z/, message: 'only allows letters' }
  validates :location, format: { with: /\A\d+\z/, message: "only allows numbers" }
  validates_length_of :title, in: 15..100
  validates_length_of :description, in: 100..500

  belongs_to :tour

  def attributes_not_nil
    [:title, :description, :location].each do |attr|
      if self[attr].nil?
        errors.add(attr, "can't be nil")
      end
    end
  end
end
