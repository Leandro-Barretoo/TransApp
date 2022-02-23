require 'rails_helper'

RSpec.describe '/buys', type: :request do
    before(:each) do
        @user = create(:user)
        sign_in @user
    end

    describe 'GET /new' do
        it 'renders a successful response' do
            get new_buy_url
            expect(response).to be_successful
        end
    end

    describe 'POST /create' do
        context 'with valid parameters' do
            it 'creates a new transaction' do
                expect do
                    post buys_url,
                        params: { buy: FactoryBot.attributes_for(:buy, group_ids: FactoryBot.create(:group).id) }
                end.to change(Buy, :count).by(1)
            end
        end

        context 'with invalid parameters' do
            it 'does not create a new transaction' do
                expect do
                    post buys_url, params: { buy: FactoryBot.attributes_for(:buy, name: nil) }
                end.to change(Group, :count).by(0)
            end

            it 'renders the form again' do
                post buys_url, params: { buy: FactoryBot.attributes_for(:buy, name: nil) }
                expect(response).not_to be_successful
            end
        end
    end
end