class CreateGroupBuys < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :buys do |t|
      t.index [:group_id, :buy_id]
      
      t.timestamps
    end
  end
end
