class AddStripeCardTokenToMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :card_token, :string
  end
end
