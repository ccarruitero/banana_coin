class Account < ApplicationRecord
  validates :address, uniqueness: true
  has_many :transactions

  def to_param
    address
  end

  def self.find(input)
    find_by_address(input)
  end

  def sha_address(string)
    Digest::SHA256.hexdigest(string)
  end
end
