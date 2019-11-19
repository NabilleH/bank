# Bank Account

![alt text](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVLQDeQISvkW3Cm2Q_olv_qa6kHOVNpXhvRSvLJJSUiwFm8-yJtA&s)

## Requirements

This small program allows you to create a bank account which facilitates deposit, withdrawal and statement producing functions. An account statement includes a date, amount and balance which can be printed out to the screen.

It was assumed that the user of this application would be a bank employee. It was therefore also assumed that the account may go into deficit if a debit transaction is performed, where there may be insufficient funds on the account.

## Setup

 1. Clone this repo locally -
 ```git clone git@github.com:NabilleH/bank.git```

 2. Run ```Bundle install``` from the command line to install project depencies.

 3. Run ```rspec``` from the command line to confirm the latest automated tests are all passing. Simplecov test coverage is output after the test run. This should show 100% coverage.

## User guide

Run ```irb``` from the command line, require the dependant file and instantiate an account to use.

```
2.6.3 :001 > require './lib/account'
 => true
2.6.3 :002 > account = Account.new("Test Account")
 => #<Account:0x00007ff130041bf8 @name="Test Account", @balance=0, @history=[], @statement=#<Statement:0x00007ff130041ba8>>
```
Make a deposit to your account. For both deposits and withdrawals an integer must be entered, else an error will be returned. Pennies may be entered but whole numbers (pounds) will also have pennies appended for display purposes.
```
2.6.3 :003 > account.credit(1000.00)
 => [{:date=>"11/19/2019", :type=>"credit", :amount=>"1000.00", :balance=>"1000.00"}]
 ```
Make a withdrawal from your account
```
2.6.3 :004 > account.debit(500)
 => [{:date=>"11/19/2019", :type=>"debit", :amount=>"500.00", :balance=>"500.00"}]
 ```
Print out a statement of your Account. The newest transactions are displayed first.
```
2.6.3 :005 > account.print_statement
date || credit || debit || balance
11/19/2019 || || 500.00 || 500.00
11/19/2019 || 1000.00 || || 1000.00
```
