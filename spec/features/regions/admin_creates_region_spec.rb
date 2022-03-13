require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
    
    scenario "with valid attributes succeeds" do
        user = create(:admin)
        user.confirm
        log_in_as(user)
        
        visit '/regions/new'
        fill_in 'Name', with: "Fake Region"
        click_on 'Add Region'
        expect(page).to have_text "Region successfully created"
        expect(page).to have_text 'Fake Region'

    end

    scenario "with invalid attrubutes shows an error" do
        user = create(:admin)
        user.confirm
        log_in_as(user)
        visit '/regions/new'
        fill_in 'Name', with: ''
        click_on 'Add Region'

        expect(page).to have_text 'errors prohibited this region'
    end

end
