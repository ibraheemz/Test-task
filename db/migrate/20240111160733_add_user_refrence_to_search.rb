class AddUserRefrenceToSearch < ActiveRecord::Migration[7.0]
  def change
    add_reference :searches, :users, foreign_key: true
  end
end
