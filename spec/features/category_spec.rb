require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  let(:category){build(:category)}


  scenario "root" do
    visit root_path
    expect(page).to have_content("Category")  
  end

  scenario "category index" do
    visit categories_path
    expect(page).to have_content("Categories")  
  end

  scenario "#new" #do
  #   visit categories_path
  #   click_on "create category"
  #   within ("#new_category") do
  #     fill_in "title", with: "todolist類別" 
  #   end
    
  # end


  scenario "#edit" 
  scenario "#destroy" 



end
