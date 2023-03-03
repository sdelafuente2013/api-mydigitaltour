# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, :lastname, :email, :role, :status, presence: true
  validates :role, inclusion: { in: %w[user guia admin] }
  validates :status, inclusion: { in: [true, false] }
  validate :attributes_not_nil

  def attributes_not_nil
    [:name, :role, :status].each do |attr|
      if self[attr].nil?
        errors.add(attr, "can't be nil")
      end
    end
  end

end
