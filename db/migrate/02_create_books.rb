class CreateBooks < ActiveRecord::Migration[4.2]
    def change
      create_table :books do |t|
        t.string :name
        t.string :author
        t.string :genre
        t.string :rating
        t.timestamps null: false
      end
    end
  end
  