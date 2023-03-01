# frozen_string_literal: true

class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :role, :string
    add_column :users, :status, :boolean
  end
end
