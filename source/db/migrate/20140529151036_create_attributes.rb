class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :question
      t.string :endpoint1
      t.string :endpoint2

      t.timestamps
    end
  end
end
