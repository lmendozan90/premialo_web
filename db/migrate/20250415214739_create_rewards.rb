class CreateRewards < ActiveRecord::Migration[8.0]
  def change
    create_table :rewards do |t|
      t.integer :points
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :available_from
      t.datetime :available_until

      t.timestamps
    end
  end
end
