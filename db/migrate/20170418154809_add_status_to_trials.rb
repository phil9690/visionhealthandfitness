class AddStatusToTrials < ActiveRecord::Migration[5.0]
  def change
    add_column :trials, :status, :string
  end
end
