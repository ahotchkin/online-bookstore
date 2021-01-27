class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :publisher_id
      t.integer :author_id
      
      t.timestamps
    end
  end
end
