class BankAccount

	def initialize(transactions)
		@transactions = transactions
	end

	def filter_todays_transactions
		@transactions.select {|t| t.purchase_date == Date.today}
	end

	def total_spent_today
		filter_todays_transactions.inject(0){ |sum, t| sum + t.amount }
	end
end