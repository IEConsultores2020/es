class AddUserToEinvoice < ActiveRecord::Migration
  def change
    add_reference :einvoices, :user, index: true, foreign_key: true
  end
end
