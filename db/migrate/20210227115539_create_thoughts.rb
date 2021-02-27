class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.text :text, null: false
      t.integer :message_id, null: false
      t.timestamps
    end
  end
end
