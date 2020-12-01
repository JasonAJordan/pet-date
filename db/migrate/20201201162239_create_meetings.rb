class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|

      t.datetime :time 
      t.string :status 
      t.integer :requester_id 
      t.integer :requestie_id
      t.integer :location_id

      t.timestamps
    end
  end
end
