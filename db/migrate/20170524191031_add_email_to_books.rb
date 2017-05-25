class AddEmailToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :email, :string
  end
end
