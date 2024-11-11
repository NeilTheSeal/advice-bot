class OutgoingEmail < ApplicationRecord
  belongs_to :incoming_email
  validates :email, :subject, :content, presence: true
end
