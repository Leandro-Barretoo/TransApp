require 'rails_helper'

RSpec.describe '/groups', type: :request do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      FactoryBot.create(:group, user: @user)
      get groups_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      group = FactoryBot.create(:group, user: @user)
      get group_url(group)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        expect do
          post groups_url, params: { group: FactoryBot.attributes_for(:group) }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to the created category' do
        post groups_url, params: { group: FactoryBot.attributes_for(:group) }
        expect(response).to redirect_to(root_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        expect do
          post groups_url, params: { group: FactoryBot.attributes_for(:group, name: nil) }
        end.to change(Group, :count).by(0)
      end

      it 'renders the form again' do
        post groups_url, params: { group: FactoryBot.attributes_for(:group, name: nil) }
        expect(response).not_to be_successful
      end
    end
  end
end
