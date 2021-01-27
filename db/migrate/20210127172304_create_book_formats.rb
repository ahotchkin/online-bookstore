class CreateBookFormats < ActiveRecord::Migration[6.0]
  def change
    create_table :book_formats do |t|
      t.integer :book_id
      t.integer :book_format_type_id
      
      t.timestamps
    end
  end
end
