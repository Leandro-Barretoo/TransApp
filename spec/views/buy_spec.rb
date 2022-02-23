require 'rails_helper'

RSpec.feature 'BuyIndex', type: :feature do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  background do
    @category = FactoryBot.create(:group, user: @user)
    FactoryBot.build_list(:buy, 2, author: @user, group_ids: @category.id)
  end

  scenario 'List all transactions' do
    visit group_path(@category)
    @category.buys.each do |buy|
      expect(page).to have_content buy.name
    end
  end

  scenario 'User could see the total amount for the category' do
    visit group_path(@category)
    expect(page).to have_content @category.total.round
  end

  scenario 'User can see add transaction button' do
    visit group_path(@category)
    click_link 'Add transaction'
    expect(page).to have_current_path(new_buy_path)
  end
end
