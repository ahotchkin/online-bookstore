class BookFormatType < ApplicationRecord
  has_many :book_formats
  has_many :books, through: :book_formats
  validates_presence_of :name
end
