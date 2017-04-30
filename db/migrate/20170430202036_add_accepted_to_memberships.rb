class AddAcceptedToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :terms_accepted, :boolean
  end
end
