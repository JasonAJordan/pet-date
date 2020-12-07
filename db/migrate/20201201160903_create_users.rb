class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :bio
      t.string :user_name
      t.string :neighbourhood 
      t.string :hobbies 
      t.string :favorite 
      t.string :email 

      t.string :password_digest
      t.timestamps
    end
  end
end
