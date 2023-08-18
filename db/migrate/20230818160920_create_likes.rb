class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :post_id
      t.string :user
      t.date :date

      t.timestamps
    end
  end
end
