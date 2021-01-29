# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

little_brown_and_company = Publisher.create(:name => "Little, Brown and Company")
harper_collins = Publisher.create(:name => "HarperCollins")
publisher_1 = Publisher.create(:name => "Publisher 1")

tina_fey = Author.create(:first_name => "Tina", :last_name => "Fey")
amy_poehler = Author.create(:first_name => "Amy", :last_name => "Poehler")
janet_silva = Author.create(:first_name => "Janet", :last_name => "Silva")

bossypants = Book.create(:title => "Bossypants", :publisher_id => little_brown_and_company.id, :author_id => tina_fey.id)
yes_please = Book.create(:title => "Yes Please", :publisher_id => harper_collins.id, :author_id => amy_poehler.id)
janet_book_1 = Book.create(:title => "Janet's First Book", :publisher_id => publisher_1.id, :author_id => janet_silva.id)
janet_book_2 = Book.create(:title => "Janet's Second Book", :publisher_id => publisher_1.id, :author_id => janet_silva.id)
janet_book_3 = Book.create(:title => "Janet's Third Book", :publisher_id => publisher_1.id, :author_id => janet_silva.id)
janet_book_4 = Book.create(:title => "Janet's Fourth Book", :publisher_id => publisher_1.id, :author_id => janet_silva.id)
amys_book = Book.create(:title => "Publisher 1 is the Best", :publisher_id => little_brown_and_company.id, :author_id => amy_poehler.id)
publishers_book = Book.create(:title => "Publisher 1 is Just OK", :publisher_id => publisher_1.id, :author_id => amy_poehler.id)

hardcover = BookFormatType.create(:name => "Hardcover", :physical => 1)
softcover = BookFormatType.create(:name => "Softcover", :physical => 1)
kindle = BookFormatType.create(:name => "Kindle", :physical => 0)
pdf = BookFormatType.create(:name => "PDF", :physical => 0)

BookFormat.create(:book_id => bossypants.id, :book_format_type_id => hardcover.id)
BookFormat.create(:book_id => bossypants.id, :book_format_type_id => kindle.id)
BookFormat.create(:book_id => bossypants.id, :book_format_type_id => pdf.id)
BookFormat.create(:book_id => yes_please.id, :book_format_type_id => hardcover.id)
BookFormat.create(:book_id => yes_please.id, :book_format_type_id => softcover.id)
BookFormat.create(:book_id => janet_book_1.id, :book_format_type_id => softcover.id)
BookFormat.create(:book_id => janet_book_1.id, :book_format_type_id => pdf.id)
BookFormat.create(:book_id => janet_book_2.id, :book_format_type_id => hardcover.id)
BookFormat.create(:book_id => janet_book_3.id, :book_format_type_id => hardcover.id)
BookFormat.create(:book_id => janet_book_3.id, :book_format_type_id => softcover.id)
BookFormat.create(:book_id => janet_book_3.id, :book_format_type_id => kindle.id)
BookFormat.create(:book_id => janet_book_3.id, :book_format_type_id => pdf.id)
BookFormat.create(:book_id => janet_book_4.id, :book_format_type_id => kindle.id)
BookFormat.create(:book_id => amys_book.id, :book_format_type_id => softcover.id)
BookFormat.create(:book_id => amys_book.id, :book_format_type_id => kindle.id)
BookFormat.create(:book_id => publishers_book.id, :book_format_type_id => softcover.id)
BookFormat.create(:book_id => publishers_book.id, :book_format_type_id => pdf.id)

# bossypants.average_rating = 4.5
BookReview.create(:book_id => bossypants.id, :rating => 5)
BookReview.create(:book_id => bossypants.id, :rating => 4)
# yes_please.average_rating = 4.3
BookReview.create(:book_id => yes_please.id, :rating => 4)
BookReview.create(:book_id => yes_please.id, :rating => 4)
BookReview.create(:book_id => yes_please.id, :rating => 5)
# janet_book_1.average_rating = 5.0
BookReview.create(:book_id => janet_book_1.id, :rating => 5)
BookReview.create(:book_id => janet_book_1.id, :rating => 5)
# janet_book_2.average_rating = 2.7
BookReview.create(:book_id => janet_book_2.id, :rating => 4)
BookReview.create(:book_id => janet_book_2.id, :rating => 2)
BookReview.create(:book_id => janet_book_2.id, :rating => 2)
# janet_book_3.average_rating = 4.2
BookReview.create(:book_id => janet_book_3.id, :rating => 5)
BookReview.create(:book_id => janet_book_3.id, :rating => 4)
BookReview.create(:book_id => janet_book_3.id, :rating => 5)
BookReview.create(:book_id => janet_book_3.id, :rating => 4)
BookReview.create(:book_id => janet_book_3.id, :rating => 3)
# janet_book_4.average_rating = 4.7
BookReview.create(:book_id => janet_book_4.id, :rating => 5)
BookReview.create(:book_id => janet_book_4.id, :rating => 5)
BookReview.create(:book_id => janet_book_4.id, :rating => 4)
# amys_book.average_rating = 2.3
BookReview.create(:book_id => amys_book.id, :rating => 1)
BookReview.create(:book_id => amys_book.id, :rating => 3)
BookReview.create(:book_id => amys_book.id, :rating => 3)
# publishers_book.average_rating = 3
BookReview.create(:book_id => publishers_book.id, :rating => 3)
