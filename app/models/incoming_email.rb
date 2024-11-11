class IncomingEmail < ApplicationRecord
  has_one :outgoing_email
  validates :from, :subject, :content, presence: true
end
