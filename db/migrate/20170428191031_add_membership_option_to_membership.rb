class AddMembershipOptionToMembership < ActiveRecord::Migration[5.0]
  def change
    add_reference :memberships, :membership_option, foreign_key: true
  end
end
