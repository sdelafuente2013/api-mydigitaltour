# frozen_string_literal: true

class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.string :title
      t.string :description
      t.integer :location
      t.references :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
