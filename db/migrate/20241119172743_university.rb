# frozen_string_literal: true

class University < ActiveRecord::Migration[8.0]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :location
      t.string :contact_emails, array: true, default: []
      t.string :website

      t.timestamps
    end
  end
end
