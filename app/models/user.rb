# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # name
  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/, message: 'only allows letters' }
  validates_length_of :name, in: 3..20
  validate :attributes_not_nil

  # lastname
  validates :lastname, presence: true
  validates_length_of :lastname, in: 3..15
  validates :lastname, format: { with: /\A[a-zA-Z\s]+\z/, message: 'only allows letters' }

  # role
  validates :role, presence: true
  validates :role, inclusion: { in: %w[user guia admin] }

  # status
  validates :status, presence: true

  def attributes_not_nil
    [:name, :role, :status, :email, :lastname].each do |attr|
      if self[attr].nil?
        errors.add(attr, "can't be nil")
      end
    end
  end

end
