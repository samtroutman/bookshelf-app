class CreateBooks < ActiveRecord::Migration[5.1]
    def change
      create_table :books do |t|
        t.string :name
        t.string :author
        t.string :genre
        t.string :rating
        t.integer :user_id
        t.timestamps null: false
      end
    end
  end
  