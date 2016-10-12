class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.string :urlsafe, null: false
      t.integer :visits_remaining

      t.timestamps null: false
    end
  end
end
