class CreateTimeCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :time_counts do |t|
      t.string :nickname
      t.float :time

      t.timestamps
    end
  end
end
