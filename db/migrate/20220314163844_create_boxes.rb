class CreateBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :boxes do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :size

      t.timestamps
    end
  end
end
