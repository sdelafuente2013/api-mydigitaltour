# frozen_string_literal: true

class Stage < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

         belongs_to :tour

  validates :tour_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 30 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
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
