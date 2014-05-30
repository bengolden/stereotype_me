class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :voted_on_id
      t.integer :property_id
      t.integer :value

      t.timestamps
    end
  end
end
