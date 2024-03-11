class AddUserIdToLogistics < ActiveRecord::Migration[7.1]
  def change
    add_reference :logistics, :user, null: false, foreign_key: true
  end
end
