class Search < ApplicationRecord
  scope :with_ip_address, ->(ip_address) { where('ip_address = ?', ip_address) }

  validates :ip_address, presence: true
  validates :term, presence: true
end
