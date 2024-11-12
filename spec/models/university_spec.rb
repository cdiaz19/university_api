# frozen_string_literal: true

require 'rails_helper'

RSpec.describe University, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:contact_emails) }
    it { is_expected.to validate_presence_of(:website) }
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
