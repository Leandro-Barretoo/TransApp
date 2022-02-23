require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :buy }

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

    it 'amount should be present' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'amount should be greater than 0' do
      subject.amount = 0
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    context 'belongs to an author' do
      subject { FactoryBot.build :buy }

      it 'should have an author' do
        expect(subject.author).to be_present
      end
    end

    context 'has-many groups' do
      subject { FactoryBot.build :buy_with_groups, groups_count: 5 }

      it 'should have categories' do
        expect(subject.groups.length).to be 5
      end
    end
  end
end
