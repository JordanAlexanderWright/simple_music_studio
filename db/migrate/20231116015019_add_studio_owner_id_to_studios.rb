class AddStudioOwnerIdToStudios < ActiveRecord::Migration[7.0]
  def change
    add_column :studios, :studio_owner_id, :integer
    add_foreign_key :studios, :studio_owners
  end
end
