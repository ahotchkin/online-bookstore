require 'rails_helper'

RSpec.describe BookFormatType, :type => :model do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:physical) }
  end

  describe "associations" do
    it { should have_many(:book_formats) }
    it { should have_many(:books).through(:book_formats) }
  end

end
