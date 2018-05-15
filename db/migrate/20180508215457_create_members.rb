class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :consent_to_market
      t.datetime :consent_to_market_date
      t.string :consent_to_market_ip
      t.string :consent_to_market_token
      t.string :consent_to_market_ip_address

      t.timestamps
    end
  end
end
