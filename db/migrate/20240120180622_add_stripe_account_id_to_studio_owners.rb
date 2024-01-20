class AddStripeAccountIdToStudioOwners < ActiveRecord::Migration[7.0]
  def change
    add_column :studio_owners, :stripe_account_id, :string
  end
end
