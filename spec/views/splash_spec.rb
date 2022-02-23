require 'rails_helper'

RSpec.feature 'Splash', type: :feature do
    scenario 'Welcome page' do
        visit root_path
        expect(page).to have_content 'BuySave'
        expect(page).to have_link 'Log in'
        expect(page).to have_link 'Sign up'
    end

    scenario 'Click log in to navigate to login page' do
        visit root_path
        click_link 'Log in'
        expect(page).to have_current_path(new_user_session_path)
    end

    scenario 'Click sign up to navigate to login page' do
        visit root_path
        click_link 'Sign up'
        expect(page).to have_current_path(new_user_registration_path)
    end
end