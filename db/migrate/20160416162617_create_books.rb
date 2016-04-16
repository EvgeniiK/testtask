class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :user, index: true
      t.string :name
      t.string :author
      t.text :shortdesc
      t.boolean :draft

      t.timestamps
    end
  end
end
