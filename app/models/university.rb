# frozen_string_literal: true

class University < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :contact_emails, presence: true
  validates :website, presence: true

  validate :validate_emails

  scope :search_by_name, ->(query) {
    where("name ILIKE ?", "%#{query}%") if query.present?
  }

  def validate_emails
    return if self.contact_emails.blank?
    invalid_emails = contact_emails.reject { |email| email.match?(URI::MailTo::EMAIL_REGEXP) }
    errors.add(:contact_emails, "#{invalid_emails.join(', ')} are not valid email addresses") if invalid_emails.any?
  end
end
