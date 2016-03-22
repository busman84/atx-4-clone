require_relative '../bank_account'

describe BankAccount do
  context 'instance methods' do
    before :each do
      @bank_account = BankAccount.new('Britney Jo')
    end

    describe 'initialize' do
      it 'creates a new bank account' do
        expect(@bank_account.class).to eq(BankAccount)
      end

      it 'is called with an owner parameter' do
        expect(@bank_account.owner).to eq('Britney Jo')
      end

      it 'sets the balance equal to 0' do
        expect(@bank_account.balance).to eq(0)
      end
    end

    describe 'deposit' do
      it 'adds the amount given to the balance' do
        @bank_account.deposit(50)
        expect(@bank_account.balance).to eq(50)
      end

      it 'returns the modified bank account object' do
        expect(@bank_account.deposit(50).class).to eq(BankAccount)
      end
    end

    describe 'withdraw' do
      before :each do
        @bank_account.deposit(200)
      end

      it 'adds the amount given to the balance' do
        @bank_account.withdraw(50)
        expect(@bank_account.balance).to eq(150)
      end

      it 'returns the modified bank account object' do
        expect(@bank_account.withdraw(50).class).to eq(BankAccount)
      end

      it 'does not modify balance if amount is greater than balance' do
        @bank_account.withdraw(250)
        expect(@bank_account.balance).to eq(200)
      end
    end
  end
end
