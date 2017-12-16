require 'rails_helper'

RSpec.describe Question, type: :model do
  it "has a valid question" do
    expect(question(1)).to eq 1
  end
end

RSpec.describe Question, type: :model do
  it "has a valid question" do
  	question = build(:question)

    expect(question).to be_valid
  end
end