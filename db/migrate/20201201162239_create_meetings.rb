class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|

      t.integer :time 
      t.string :status 
      t.integer :requester_id 
      t.integer :requestie_id

      t.timestamps
    end
  end
end
