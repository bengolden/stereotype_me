class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :suggestion
      t.string :endpoint1
      t.string :endpoint2
      t.integer :user_id

      t.timestamps
    end
  end
end
