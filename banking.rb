class Person
	attr_reader :name
	attr_accessor :cash
	def initialize(name, cash)
		@name = name
		@cash = cash
		puts "Hi, #{@name}. You have $#{@cash}!"
	end
end

class Bank
	attr_reader :balance, :name, :acounts
	attr_writer :withdraw, :deposit
	def initialize(name)
		@name = name
		@acounts = Hash.new
		puts "#{@name} bank was just created."
	end

	def open_account(person)
		@acounts[person.name] = 0
		puts "#{person.name}, thanks for opening an account at #{@name}!"
	end

	def withdraw(person, money)
		if @acounts[person.name] - money < 0
			return puts "#{person.name} does not have enough money in the account to withdraw $#{money}."
		else
			@acounts[person.name] -= money
			return puts "#{person.name} withdrew $#{money} from #{@name}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{@acounts[person.name]}."
		end 
	end

	def deposit(person, money)
		if person.cash - money < 0
			return puts "#{person.name} does not have enough cash to deposit $#{money}."
		else
			person.cash -= money
			@acounts[person.name] += money
			return puts "#{person.name} deposited $#{money} to #{@name}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{@acounts[person.name]}."
		end
	end 

	def transfer(person, bank, money)
		self.withdraw(person, money)
		
		bank.acounts[person.name] += money
		
		puts "#{person.name} transfered $#{money} from the #{@name} account to the #{bank.name}. The #{@name} account has $#{self.balance(person)} and the #{bank.name} account has $#{bank.balance(person)}."
	end

	def balance(person)
		@acounts[person.name]
	end

	def total_cash_in_bank
		total = 0
		@acounts.each { |k,v| total += v}
		"#{@name} has $#{total} in the bank."
	end
end

