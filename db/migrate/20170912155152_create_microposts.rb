class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.boolean :archived, default: false, null: false
      t.text :content, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
