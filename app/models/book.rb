class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author
  has_many :book_reviews
  has_many :book_formats
  has_many :book_format_types, through: :book_formats
  validates_presence_of :title

  # remamed to book_format_type as calling this book_format_types produces an error since that is an attribute of self
  def book_format_type
    # Returns a collection of the BookFormatTypes this book is available in
    self.book_format_types
  end

  def author_name
    # The name of the author of this book in “lastname, firstname” format
    "#{self.author.last_name}, #{self.author.first_name}"
  end

  def average_rating
    # The average (mean) of all the book reviews for this book. Rounded to one decimal place.
    ratings_array = self.book_reviews.collect { |book_review| book_review.rating }
    (ratings_array.sum.to_f / ratings_array.length.to_f).round(1)
  end

  def self.search(query, options = nil)
    # Returns a collection of books that match the query string, subject to the following rules:
      # 1. If the last name of the author matches the query string exactly (case insensitive)
      # 2. If the name of the publisher matches the query string exactly (case insensitive)
      # 3. If any portion of the book’s title matches the query string (case insensitive)
    # The results should be the union of books that match any of these three rules. The results should be ordered by average rating, with the highest rating first. The list should be unique (the same book shouldn't appear multiple times in the results).
    # Search options:
      # :title_only (defaults to false). If true, only return results from rule #3 above.
      # :book_format_type_id (defaults to nil). If supplied, only return books that are available in a format that matches the supplied type id.
      # :book_format_physical (defaults to nil). If supplied as true or false, only return books that are available in a format whose “physical” field matches the supplied argument. This filter is not applied if the argument is not present or nil.
    # The title_only and book_format options are not exclusive of each other, so Book.search('Karamazov', title_only: true, book_format_physical: true) should return all physical books whose title matches that term.

    # self.sort_by_average_rating.select { |book| book.author.last_name.downcase == query.downcase || book.publisher.name.downcase == query.downcase || book.title.downcase.include?(query.downcase) && book.book_format_type_ids.include?(options[:book_format_type_id] if options[:book_format_type_id]}



    # I want to be able to find the options I have and ignore if they are nil
    # can I filter array returned in else statement based on options that are not nil?
    # puts options[:book_format_physical]
    # self.sort_by_average_rating.select do |book|
    #   if options == nil
    #     book.author.last_name.downcase == query.downcase || book.publisher.name.downcase == query.downcase || book.title.downcase.include?(query.downcase)
    #   elsif options[:title_only] = true
    #     book.title.downcase.include?(query.downcase)
    #   elsif options[:book_format_type_id]
    #     book.author.last_name.downcase == query.downcase || book.publisher.name.downcase == query.downcase || book.title.downcase.include?(query.downcase) && book.book_format_type_ids.include?(options[:book_format_type_id])
    #   elsif options[:book_format_phsyical]
    #     book.author.last_name.downcase == query.downcase || book.publisher.name.downcase == query.downcase || book.title.downcase.include?(query.downcase) && book.book_format_types.collect { |book_format_type| book_format_type.physical == options[:book_format_physical] }.include?(true)
    #   elsif options[:title_only] && options[:book_format_type_id]
    #     book.title.downcase.include?(query.downcase) && book.book_format_type_ids.include?(options[:book_format_type_id])
    #   elsif options[:title_only] && options[:book_format_phsyical]
    #     book.title.downcase.include?(query.downcase) && book.book_format_types.collect { |book_format_type| book_format_type.physical == options[:book_format_physical] }.include?(true)
    #   end
    # end

    self.sort_by_average_rating.select do |book|
      book_by_query = book.author.last_name.downcase == query.downcase || book.publisher.name.downcase == query.downcase || book.title.downcase.include?(query.downcase)
      book_by_title = book.title.downcase.include?(query.downcase)

      case options
      when nil
        book_by_query
      when options[:title_only] = true
        book_by_title
      when options[:book_format_type_id]
        book_by_query && book.book_format_type_ids.include?(options[:book_format_type_id])
      when options[:book_format_phsyical]
        book_by_query && book.book_format_types.collect { |book_format_type| book_format_type.physical == options[:book_format_physical] }.include?(true)
      when options[:title_only] && options[:book_format_type_id]
        book_by_title && book.book_format_type_ids.include?(options[:book_format_type_id])
      when options[:title_only] && options[:book_format_phsyical]
        book_by_title && book.book_format_types.collect { |book_format_type| book_format_type.physical == options[:book_format_physical] }.include?(true)
      end
    end


    # option combinations:
      # title_only
      # book_format_type_id
      # book_format_physical

      # title_only & book_format_type_id
      # title_only & book_format_phsyical

      # below combinations are not needed - if you have book_format_type_id there is no need to specify book_format_physical
        # book_format_type_id & book_format_physical
        # title_only & book_format_type_id & book_format_physical


  end

  def self.sort_by_average_rating
    self.all.sort_by(&:average_rating).reverse
  end

end
