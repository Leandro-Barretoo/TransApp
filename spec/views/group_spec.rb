require 'rails_helper'

RSpec.feature 'GroupIndex', type: :feature do
    background do
        @user = FactoryBot.create(:user_with_groups)
        sign_in @user
    end

    scenario 'When logged in, redirects to groups index page' do
        visit root_path
        expect(page). to have_content 'Categories'
    end

    scenario 'User can see group name, total amount that belongs to each category' do
        visit root_path
        @user.groups.each do |group|
            expect(page).to have_content group.name
            expect(page).to have_content group.total
        end
    end

    scenario 'If user clicks category it redirects to transaction page' do
        visit root_path
        group = @user.groups.first
        find("a[href='#{group_path(group)}']").click
        expect(page).to have_current_path(group_path(group))
    end

    scenario 'User can see add a new transaction button at the bottom of page' do
        visit root_path
        click_link 'Add category'
        expect(page).to have_current_path(new_group_path)
    end
end