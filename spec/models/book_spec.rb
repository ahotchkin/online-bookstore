require 'rails_helper'

RSpec.describe Book, :type => :model do

  let(:little_brown_and_company) { Publisher.create(:name => "Little, Brown and Company") }
  let(:harper_collins) { Publisher.create(:name => "HarperCollins") }
  let(:publisher_1) { Publisher.create(:name => "Publisher 1") }

  let(:tina_fey) { Author.create(:first_name => "Tina", :last_name => "Fey") }
  let(:amy_poehler) { Author.create(:first_name => "Amy", :last_name => "Poehler") }
  let(:janet_silva) { Author.create(:first_name => "Janet", :last_name => "Silva") }

  let(:bossypants) { Book.create(:title => "Bossypants", :publisher_id => little_brown_and_company.id, :author_id => tina_fey.id) }
  let(:yes_please) { Book.create(:title => "Yes Please", :publisher_id => harper_collins.id, :author_id => amy_poehler.id) }
  let(:janet_book_1) { Book.create(:title => "Janet's First Book", :publisher_id => publisher1.id, :author_id => janet_silva.id) }
  let(:janet_book_2) { Book.create(:title => "Janet's Second Book", :publisher_id => publisher1.id, :author_id => janet_silva.id) }
  let(:janet_book_3) { Book.create(:title => "Janet's Third Book", :publisher_id => publisher1.id, :author_id => janet_silva.id) }
  let(:janet_book_4) { Book.create(:title => "Janet's Fourth Book", :publisher_id => publisher1.id, :author_id => janet_silva.id) }
  let(:amys_book) { Book.create(:title => "Publisher 1 is the Best", :publisher_id => little_brown_and_company.id, :author_id => amy_poehler.id) }

  let(:hardcover) { BookFormatType.create(:name => "Hardcover", :physical => true) }
  let(:softcover) { BookFormatType.create(:name => "Softcover", :physical => true) }
  let(:kindle) { BookFormatType.create(:name => "Kindle", :physical => false) }
  let(:pdf) { BookFormatType.create(:name => "PDF", :physical => false) }

  # BookFormat.create(:book_id => bossypants.id, :book_format_type_id => hardcover.id)
  # BookFormat.create(:book_id => bossypants.id, :book_format_type_id => kindle.id)
  # BookFormat.create(:book_id => bossypants.id, :book_format_type_id => pdf.id)
  # BookFormat.create(:book_id => yes_please.id, :book_format_type_id => hardcover.id)
  # BookFormat.create(:book_id => yes_please.id, :book_format_type_id => softcover.id)
  # BookFormat.create(:book_id => janet_book_1.id, :book_format_type_id => softcover.id)
  # BookFormat.create(:book_id => janet_book_1.id, :book_format_type_id => pdf.id)
  # BookFormat.create(:book_id => janet_book_2.id, :book_format_type_id => hardcover.id)
  # BookFormat.create(:book_id => janet_book_3.id, :book_format_type_id => hardcover.id)
  # BookFormat.create(:book_id => janet_book_3.id, :book_format_type_id => softcover.id)
  # BookFormat.create(:book_id => janet_book_3.id, :book_format_type_id => kindle.id)
  # BookFormat.create(:book_id => janet_book_3.id, :book_format_type_id => pdf.id)
  # BookFormat.create(:book_id => janet_book_4.id, :book_format_type_id => kindle.id)
  # BookFormat.create(:book_id => amys_book.id, :book_format_type_id => softcover.id)
  # BookFormat.create(:book_id => amys_book.id, :book_format_type_id => kindle.id)
  #
  # # bossypants.average_rating = 4.5
  # BookReview.create(:book_id => bossypants.id, :rating => 5)
  # BookReview.create(:book_id => bossypants.id, :rating => 4)
  # # yes_please.average_rating = 4.3
  # BookReview.create(:book_id => yes_please.id, :rating => 4)
  # BookReview.create(:book_id => yes_please.id, :rating => 4)
  # BookReview.create(:book_id => yes_please.id, :rating => 5)
  # # janet_book_1.average_rating = 5.0
  # BookReview.create(:book_id => janet_book_1.id, :rating => 5)
  # BookReview.create(:book_id => janet_book_1.id, :rating => 5)
  # # janet_book_2.average_rating = 2.7
  # BookReview.create(:book_id => janet_book_2.id, :rating => 4)
  # BookReview.create(:book_id => janet_book_2.id, :rating => 2)
  # BookReview.create(:book_id => janet_book_2.id, :rating => 2)
  # # janet_book_3.average_rating = 4.0
  # BookReview.create(:book_id => janet_book_3.id, :rating => 5)
  # BookReview.create(:book_id => janet_book_3.id, :rating => 4)
  # BookReview.create(:book_id => janet_book_3.id, :rating => 5)
  # BookReview.create(:book_id => janet_book_3.id, :rating => 4)
  # BookReview.create(:book_id => janet_book_3.id, :rating => 2)
  # # janet_book_4.average_rating = 5.0
  # BookReview.create(:book_id => janet_book_4.id, :rating => 5)
  # BookReview.create(:book_id => janet_book_4.id, :rating => 5)
  # # amys_book.average_rating = 2.7
  # BookReview.create(:book_id => amys_book.id, :rating => 1)
  # BookReview.create(:book_id => amys_book.id, :rating => 3)
  # BookReview.create(:book_id => amys_book.id, :rating => 4)

  # let(:book_format_1) {
  #   BookFormat.create(:book_id => bossypants.id, :book_format_type_id => hardcover.id)
  # }
  #
  # let(:book_format_2) {
  #   BookFormat.create(:book_id => bossypants.id, :book_format_type_id => kindle.id)
  # }
  #
  # let(:book_format_3) {
  #   BookFormat.create(:book_id => bossypants.id, :book_format_type_id => pdf.id)
  # }
  #
  # let(:book_format_4) {
  #   BookFormat.create(:book_id => yes_please.id, :book_format_type_id => hardcover.id)
  # }
  #
  # let(:book_format_5) {
  #   BookFormat.create(:book_id => yes_please.id, :book_format_type_id => softcover.id)
  # }
  #
  # let(:book_review_1) {
  #   BookReview.create(:book_id => bossypants.id, :rating => 5)
  # }
  #
  # let(:book_review_2) {
  #   BookReview.create(:book_id => bossypants.id, :rating => 4)
  # }
  #
  # let(:book_review_3) {
  #   BookReview.create(:book_id => yes_please.id, :rating => 4)
  # }
  #
  # let(:book_review_4) {
  #   BookReview.create(:book_id => yes_please.id, :rating => 4)
  # }
  #
  # let(:book_review_5) {
  #   BookReview.create(:book_id => yes_please.id, :rating => 5)
  # }

  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe "associations" do
    it { should belong_to(:publisher) }
    it { should belong_to(:author) }
  end

  it "has an instance method 'book_format_type' that returns a collection of BookFormatTypes this book is available in" do
    # hardcover = BookFormatType.create(:name => "Hardcover", :physical => true)
    # softcover = BookFormatType.create(:name => "Softcover", :physical => true)
    # kindle = BookFormatType.create(:name => "Kindle", :physical => false)
    # pdf = BookFormatType.create(:name => "PDF", :physical => false)
    #
    BookFormat.create(:book_id => bossypants.id, :book_format_type_id => hardcover.id)
    BookFormat.create(:book_id => bossypants.id, :book_format_type_id => kindle.id)
    BookFormat.create(:book_id => bossypants.id, :book_format_type_id => pdf.id)
    BookFormat.create(:book_id => yes_please.id, :book_format_type_id => hardcover.id)
    BookFormat.create(:book_id => yes_please.id, :book_format_type_id => softcover.id)

    expect(bossypants.book_format_type[0].name).to eq("Hardcover")
    expect(bossypants.book_format_type[1].name).to eq("Kindle")
    expect(bossypants.book_format_type[2].name).to eq("PDF")
    expect(yes_please.book_format_type[0].name).to eq("Hardcover")
    expect(yes_please.book_format_type[1].name).to eq("Softcover")

  end

  it "has an instance method 'author_name' that returns the name of the author of this book in “lastname, firstname” format" do
    expect(bossypants.author_name).to eq("Fey, Tina")
    expect(yes_please.author_name).to eq("Poehler, Amy")
  end

  it "has an instance method 'average_rating' that returns the average (mean) of all the book reviews for this book. Rounded to one decimal place." do
    BookReview.create(:book_id => bossypants.id, :rating => 5)
    BookReview.create(:book_id => bossypants.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 5)

    expect(bossypants.average_rating).to eq (4.5)
    expect(yes_please.average_rating).to eq (4.3)
  end

  it "has a class method 'sort_by_average_rating' that returns an array of all books sorted by average rating, from highest to lowest" do
    BookReview.create(:book_id => bossypants.id, :rating => 5)
    BookReview.create(:book_id => bossypants.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 5)

    expect(Book.sort_by_average_rating[0].title).to eq("Bossypants")
    expect(Book.sort_by_average_rating[1].title).to eq("Yes Please")
  end

  it "has a class method 'search' that returns a collection of books based on the query and options passed in" do
    Book.create(:title => "Yes Please", :publisher_id => harper_collins.id, :author_id => amy_poehler.id)
    Book.create(:title => "Publisher 1 is the Best", :publisher_id => little_brown_and_company.id, :author_id => amy_poehler.id)
    BookReview.create(:book_id => bossypants.id, :rating => 5)
    BookReview.create(:book_id => bossypants.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 4)
    BookReview.create(:book_id => yes_please.id, :rating => 5)

    expect(Book.search("boss")[0].title).to eq("Bossypants")
    expect(Book.search("boss").length).to eq(1)
    expect(Book.search("poehler")[0].title).to eq("Yes Please")
    expect(Book.search("poehler")[1].title).to eq("Publisher 1 is the Best")
    expect(Book.search("poehler").length).to eq(2)
  end
end
