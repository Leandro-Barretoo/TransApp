require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  background do
    @user = FactoryBot.create(:user, password: '987654')
  end

  scenario 'Log in with the correct credentials' do
    visit new_user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: '987654'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Log in with the incorrect credentials' do
    visit new_user_session_path
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
