class AddNicknameToLog < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :nickname, :string
  end
end
