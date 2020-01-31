class CreateVisibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :visibilities do |t|
      t.belongs_to :role, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :message, foreign_key: true

      t.timestamps
    end
  end
end
