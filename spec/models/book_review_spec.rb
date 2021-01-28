require 'rails_helper'

RSpec.describe BookReview, :type => :model do

  describe "validations" do
    it { should validate_presence_of(:rating) }
  end

  describe "associations" do
    it { should belong_to(:book) }
  end

end
