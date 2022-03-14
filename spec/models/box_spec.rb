require 'rails_helper'

RSpec.describe Box, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:category) }

    it { should have_many(:items) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
