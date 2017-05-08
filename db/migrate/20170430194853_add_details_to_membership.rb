class AddDetailsToMembership < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :title, :string
    add_column :memberships, :address_line_1, :string
    add_column :memberships, :address_line_2, :string
    add_column :memberships, :city, :string
    add_column :memberships, :post_code, :string
    add_column :memberships, :dob, :date
  end
end
