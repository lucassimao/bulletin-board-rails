class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :profiles, array: true
      t.string :email
      t.string :password_digest
      t.string :picture_url

      t.timestamps
    end
  end
end
