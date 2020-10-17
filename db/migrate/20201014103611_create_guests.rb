# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.integer :attendee_id
      t.integer :attended_event_id
      t.timestamps
    end
  end
end
