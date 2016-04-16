class CreateGenreBooks < ActiveRecord::Migration
  def change
    create_table :genre_books do |t|
      t.references :genre, index: true
      t.references :book, index: true

      t.timestamps
    end
  end
end
