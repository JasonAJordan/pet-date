class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species 
      t.string :bio
      t.integer :age
      t.string :likes
      t.string :dislikes
      t.integer :user_id

      t.timestamps
    end
  end
end
