class AddOrganizationRefToRole < ActiveRecord::Migration[5.2]
  def change
    add_reference :roles, :organization, foreign_key: {to_table: :organization}
  end
end
