class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :email
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.boolean :consent_to_market, default: false
      t.datetime :consent_to_market_date
      t.string :consent_to_market_ip
      t.string :consent_to_market_token
      t.string :consent_to_market_ip_address
      t.string :member_type
      t.boolean :active

      t.boolean :email_sent, default: false
      t.boolean :text_message_1_sent, default: false
      t.boolean :text_message_2_sent, default: false

      t.timestamps
    end
  end
end
