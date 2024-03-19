class AddUserAssociationToLogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :logs, :user, null: false, foreign_key: true
  end
end
