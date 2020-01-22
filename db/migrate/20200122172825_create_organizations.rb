class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :picture_url

      t.timestamps
    end
  end
end
