require 'spec_helper'
require 'date'

describe BankAccount do

	let(:transaction1) { double('transaction', purchase_date: Date.today) }
	let(:transaction2) { double('transaction', purchase_date: Date.today) }
	let(:transaction3) { double('transaction', purchase_date: Date.today.next_day) }

	it "returns an array of only todays transactions" do
		
		bank_account = BankAccount.new([transaction1, transaction2, transaction3])
		expect(bank_account.filter_todays_transactions).to match([transaction1, transaction2])
	end

	it "displays the sum for only todays transactions" do
		allow(transaction1).to receive(:amount).and_return(25.00)
		allow(transaction2).to receive(:amount).and_return(50.00)
		allow(transaction3).to receive(:amount).and_return(100.00)

		bank_account = BankAccount.new([transaction1, transaction2, transaction3])

		expect(bank_account.total_spent_today).to eq(75)
	end
end