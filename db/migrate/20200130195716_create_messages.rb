class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :author, index: true,  foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
