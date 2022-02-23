require 'rails_helper'

RSpec.feature 'NewTransactions', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  background do
    @group = FactoryBot.create(:group, user: @user)
  end

  given(:buy) { FactoryBot.build(:buy) }

  scenario 'A new transaction is made with correct attributes' do
    visit new_buy_path
    within 'form' do
      fill_in 'Name', with: buy.name
      fill_in 'Amount ($)', with: buy.amount
      select @group.name
    end
    click_button 'Save'
    expect(page).to have_current_path group_path(@group)
  end

  scenario 'A new transaction is made with correct attributes' do
    visit new_buy_path
    within 'form' do
      fill_in 'Name', with: buy.name
      fill_in 'Amount ($)', with: buy.amount
    end
    click_button 'Save'
    expect(page).to have_content "Groups can't be blank"
  end
end
