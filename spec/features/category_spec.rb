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

  scenario "#new" do
    visit categories_path
    click_on "create category"
    within ("form") do
      fill_in "title", with: Faker::Lorem.characters(number: 10) 
    end
    click_on 'Submit'
    expect(page).to have_content("Create succeed!!")  
  end

  scenario "#edit" do
    category = create(:category)
    visit categories_path
    click_on "Edit"
    within ("form") do
      fill_in "title", with: Faker::Lorem.characters(number: 20) 
    end
    click_on 'Submit'
    expect(page).to have_content("Update succeed!!")  
  end

  scenario '#show' do
    category = create(:category)
    visit categories_path
    click_on "Show"
    expect(page).to have_content(category.title) 
  end

  scenario "#destroy" do
    category = create(:category)
    visit categories_path
    accept_confirm do
      click_on 'Delete'
    end
    expect(page).to have_content("Category was successfully destroyed")
    expect(page).not_to have_content(category.title)    
  end


end
