require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :group }

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

    it 'icon should be present' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    context 'belongs to a user' do
      subject { FactoryBot.build :group }

      it 'should have a user' do
        expect(subject.user).to be_present
      end
    end

    context 'has-many buys' do
      subject { FactoryBot.build :group_with_buys, buys_count: 5 }

      it 'should have transactions' do
        expect(subject.buys.length).to be 5
      end
    end
  end
end
