class CreateTrials < ActiveRecord::Migration[5.0]
  def change
    create_table :trials do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :contact_number

      t.timestamps
    end

    add_index :trials, :email, unique: true
  end
end
