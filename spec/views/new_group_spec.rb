require 'rails_helper'

RSpec.feature 'AddCategory', type: :feature do
    before(:each) do
        @user = FactoryBot.create(:user)
        sign_in @user
    end

    given(:group) { FactoryBot.build(:group) }

    scenario 'Create group using valid attributes' do
        visit new_group_path
        within 'form' do
            fill_in 'Name', with: group.name
            fill_in 'Icon', with: group.icon
        end
        click_button 'Save'
        expect(page).to have_current_path groups_path
    end

    scenario 'Create group using not valid attributes' do
        visit new_group_path
        within 'form' do
            fill_in 'Name', with: group.name
        end
        click_button 'Save'
        expect(page).to have_content "Icon can't be blank"
    end
end