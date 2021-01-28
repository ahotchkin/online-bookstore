require 'rails_helper'

RSpec.describe Publisher, :type => :model do

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:books) }
  end

end
