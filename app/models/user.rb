# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # name
  validates :name, presence: true
  validates :name, :lastname, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates_length_of :name, in: 3..15
  validate :attributes_not_nil

  # lastname
  validates :lastname, presence: true
  validates_length_of :lastname, in: 3..15

  # validates :name, :lastname, :email, :role, :status, presence: true
  # validates :role, inclusion: { in: %w[user guia admin] }
  # validates :status, inclusion: { in: [true, false] }
  # validate :attributes_not_nil
  # validates :name, :lastname, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  # validates :name, :lastname, length: { minimum: 3, maximum: 15, message: 'must be between 3 and 15 characters' }
  # validates :email, uniqueness: true
  # validates_length_of :name, in: 3..15
  # validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email" }

  # { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }, message:{ "is invalid" }
  # validates :email, uniqueness: true, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/, message: "is invalid" }
  # validates :name, :lastname, length: { minimum: 3, maximum: 15, message: "min 3 and max 15 characters" }

  def attributes_not_nil
    [:name, :role, :status, :email, :lastname].each do |attr|
      if self[attr].nil?
        errors.add(attr, "can't be nil")
      end
    end
  end

end
