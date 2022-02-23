require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :user }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should not be empty' do
      subject.name = ' '
      expect(subject).to_not be_valid
    end

    it 'name should not have more than 150 chars' do
      subject.name = 'loly' * 100
      expect(subject).to_not be_valid
    end

    it 'email should be present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    context 'has-many groups' do
      subject { FactoryBot.build(:user_with_groups, groups_count: 2) }

      it 'should have groups' do
        expect(subject.groups.length).to be 2
      end
    end

    context 'has-many buys' do
      subject { FactoryBot.build(:user_with_buys, buys_count: 5) }

      it 'should have transactions' do
        expect(subject.buys.length).to be 5
      end
    end
  end
end
