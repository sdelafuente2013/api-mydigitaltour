# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, :lastname, :role, presence: true
  validates :name, :lastname, format: { with: /\A[a-zA-Z\s]+\z/, message: 'only allows letters' }
  validates_length_of :name, :lastname, in: 3..20
  validate :attributes_not_nil
  validates :role, inclusion: { in: %w[user guia admin] }
  validates :status, inclusion: [true, false]

  has_many :tours

  def attributes_not_nil
    [:name, :role, :status, :email, :lastname].each do |attr|
      if self[attr].nil?
        errors.add(attr, "can't be nil")
      end
    end
  end

end
