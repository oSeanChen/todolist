require 'rails_helper'

RSpec.describe Category, type: :model do
  let (:category_valid) {build(:category)}
  it "validates title presence" do
    title_nil = build(:category, :title_nil)
    expect(category_valid).to be_valid
    expect(title_nil).not_to be_valid
  end

  it "validates title maximum is 50" do
    title_over_50 = build(:category, :title_over_50)
    expect(category_valid).to be_valid 
    expect(title_over_50).not_to be_valid
  end



end
