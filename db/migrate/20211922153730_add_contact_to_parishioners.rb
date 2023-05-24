class AddContactToParishioners < ActiveRecord::Migration[7.0]
  def change
    add_column :parishioners, :phone, :string
    add_column :parishioners, :email, :string
  end
end
