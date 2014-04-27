require 'spec_helper'

feature 'adding a sail to the calendar', %Q{
  As an authenticated user
  I want to post a sail for all to sentences
  So I can let other people know my plans to go sailing
} do

# Acceptance Criteria:

# * Adding a sail's information will add the title to the homepage calendar
# * Clicking on that title will take me to see more information about the sail

  scenario 'with valid attributes' do
    sign_in_as(FactoryGirl.create(:user))
    visit sails_path
    click_on 'New Sail'
    fill_in 'Title', with: 'Around Spectacle Island'
    fill_in 'When', with: Date.today
    fill_in 'Details', with: 'My number is 222-222-3423.  Going at 3pm'
    click_on 'Create Sail'
    visit sails_path
    
    expect(page).to have_content('Around Spectacle Island')
    expect(page).to have_content('Boston Sailing Center Sails')
  end

  scenario 'with invalid attributes' do
    sign_in_as(FactoryGirl.create(:user))
    visit sails_path
    click_on 'New Sail'
    click_on 'Create Sail'

    expect(page).to have_content("When can't be blank")
    expect(page).to have_content("Details can't be blank")
    expect(page).to have_content("Title can't be blank")
    expect(page).to_not have_content('Created sail.')
  end
end
