class BookReview < ApplicationRecord
  belongs_to :book
  # rating can't be nil
end
