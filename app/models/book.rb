class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :author
  has_many :book_reviews
  has_many :book_formats
  has_many :book_format_types, through: :book_formats
  validates_presence_of :title

  # remamed to book_format_type as calling this method book_format_types produces an error since book_format_types is an attribute of the book instance
  def book_format_type
    self.book_format_types
  end

  def author_name
    "#{self.author.last_name}, #{self.author.first_name}"
  end

  def average_rating
    ratings_array = self.book_reviews.collect { |book_review| book_review.rating }
    (ratings_array.sum.to_f / ratings_array.length.to_f).round(1)
  end

  def self.sort_by_average_rating
    self.all.sort_by(&:average_rating).reverse
  end

  def self.search(query, options = nil)
    self.sort_by_average_rating.select do |book|
      book_by_query = book.author.last_name.downcase == query.downcase || book.publisher.name.downcase == query.downcase || book.title.downcase.include?(query.downcase)

      # option combinations:
        # title_only & book_format_type_id
        # title_only & book_format_phsyical
        # title_only
        # book_format_type_id
        # book_format_physical

        # below combinations are not needed - if you have book_format_type_id there is no need to specify book_format_physical
          # book_format_type_id & book_format_physical
          # title_only & book_format_type_id & book_format_physical

      if !!options
        if options[:title_only] && options[:book_format_type_id]
          book.title.downcase.include?(query.downcase) && book.book_format_type_ids.include?(options[:book_format_type_id])
        elsif options[:title_only] && options[:book_format_physical] != nil
          book.title.downcase.include?(query.downcase) && book.book_format_types.collect { |book_format_type| book_format_type.physical == options[:book_format_physical] }.include?(true)
        elsif options[:title_only]
          book.title.downcase.include?(query.downcase)
        elsif options[:book_format_type_id]
          book_by_query && book.book_format_type_ids.include?(options[:book_format_type_id])
        elsif options[:book_format_physical] != nil
          book_by_query && book.book_format_types.collect { |book_format_type| book_format_type.physical == options[:book_format_physical] }.include?(true)
        end
      else
        book_by_query
      end

    end
  end

end
