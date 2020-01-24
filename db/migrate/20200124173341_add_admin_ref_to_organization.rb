class AddAdminRefToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_reference :organizations, :admin, foreign_key: {to_table: :users}
  end
end
