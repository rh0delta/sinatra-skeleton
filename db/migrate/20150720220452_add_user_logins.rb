class AddUserLogins < ActiveRecord::Migration
  def change
    create_table :userlogins do |t|
      t.string :username
      t.string :password
      t.timestamps null: false
    end
  end
end
