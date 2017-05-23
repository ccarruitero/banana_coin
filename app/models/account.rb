class Account < ApplicationRecord
  validates :address, uniqueness: true
  has_many :transactions

  TRANSACTION_TYPES = ['deposito', 'retiro']
  LabelValue = Struct.new(:label, :value)
  TRANSACTION_TYPES_SELECT = TRANSACTION_TYPES.collect do |transaction|
    LabelValue.new(transaction, transaction)
  end

  def to_param
    address
  end

  def self.find(input)
    find_by_address(input)
  end

  def sha_address(string)
    Digest::SHA256.hexdigest(string)
  end

  def verify(transaction_params)
    verify_password(transaction_params[:password]) &&
    verify_instruction(transaction_params[:instruction], transaction_params[:amount])
  end

  def verify_password(password)
    address == sha_address(password)
  end

  def verify_instruction(instruction, amount)
    if instruction == 'retiro'
      (balance - amount.to_i) >= 0
    elsif instruction == 'deposito'
      true
    end
  end
end
