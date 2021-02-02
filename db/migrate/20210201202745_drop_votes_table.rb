class DropVotesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :votes
  end
end
