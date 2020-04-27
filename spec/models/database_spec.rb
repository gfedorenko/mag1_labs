require 'rails_helper'

RSpec.describe Database, :type => :model do

  subject {
    described_class.new(name: name)
  }

  context "is valid with valid attributes" do
    let(:name) { 'test_name' }
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context "is not valid without a name" do
    let(:name) { nil }
    it 'is invalid' do
      expect(subject).to_not be_valid
    end
  end

  context "is not valid with short name" do
    let(:name) { 'tt' }
    it 'is invalid' do
      expect(subject).to_not be_valid
    end
  end
end