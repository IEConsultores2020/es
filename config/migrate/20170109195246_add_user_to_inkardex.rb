class AddUserToInkardex < ActiveRecord::Migration
  def change
    add_reference :inkardexes, :user, index: true, foreign_key: true
  end
end
