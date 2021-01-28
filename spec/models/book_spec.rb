require 'rails_helper'

RSpec.describe Book, :type => :model do

  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe "associations" do
    it { should belong_to(:publisher) }
    it { should belong_to(:author) }
  end

end
