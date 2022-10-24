require 'rails_helper'

RSpec.describe Category, type: :model do
  it "validates title presence" do
    title_valid = build(:category)
    title_nil = build(:category, :title_nil)
    expect(title_valid).to be_valid
    expect(title_nil).not_to be_valid
  end


end
