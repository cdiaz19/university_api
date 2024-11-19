# frozen_string_literal: true

require 'rails_helper'

RSpec.describe University, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:contact_emails) }
    it { is_expected.to validate_presence_of(:website) }
  end

  describe 'scopes' do
    describe '.search_by_name' do
      let!(:university1) { create(:university, name: 'Harvard University') }
      let!(:university2) { create(:university, name: 'Stanford University') }
      let!(:university3) { create(:university, name: 'Massachusetts Institute of Technology') }

      context 'when a query is provided' do
        it 'returns universities matching the query (case insensitive)' do
          expect(University.search_by_name('harvard')).to contain_exactly(university1)
          expect(University.search_by_name('STANFORD')).to contain_exactly(university2)
          expect(University.search_by_name('university')).to contain_exactly(university1, university2)
        end

        it 'returns an empty result if no matches are found' do
          expect(University.search_by_name('Nonexistent University')).to be_empty
        end
      end

      context 'when the query is empty or nil' do
        it 'returns all universities if query is nil' do
          expect(University.search_by_name(nil)).to contain_exactly(university1, university2, university3)
        end

        it 'returns all universities if query is an empty string' do
          expect(University.search_by_name('')).to contain_exactly(university1, university2, university3)
        end
      end
    end
  end

  describe 'methods' do
    describe '#contact_emails' do
      let(:university) { build(:university) }
      let(:university_with_invalid_emails) { build(:university, :invalid_emails) }

      it 'validates correct emails' do
        expect(university).to be_valid
      end

      it 'invalidates incorrect emails' do
        expect(university_with_invalid_emails.valid?).to be(false)
        expect(university_with_invalid_emails.errors[:contact_emails]).to include(
          'invalid_email, example.com are not valid email addresses')
      end
    end
  end
end
