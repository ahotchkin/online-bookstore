# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Publisher.create(:name => "Little, Brown and Company")

Author.create(:first_name => "Tina", :last_name => "Fey")

Book.create(:title => "Bossypants", :publisher_id => 1, :author_id => 1)

BookFormatType.create(:name => "Hardcover", :physical => true)
BookFormatType.create(:name => "Softcover", :physical => true)
BookFormatType.create(:name => "Kindle", :physical => false)
BookFormatType.create(:name => "PDF", :physical => false)

BookFormat.create(:book_id => 1, :book_format_type_id => 1)
BookFormat.create(:book_id => 1, :book_format_type_id => 3)
BookFormat.create(:book_id => 1, :book_format_type_id => 4)

BookReview.create(:book_id => 1, :rating => 5)
BookReview.create(:book_id => 1, :rating => 4)
