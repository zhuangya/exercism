export class BankAccount {
  constructor() {
    this.accountOpend = false
  }

  open() {
    if (this.accountOpend) {
      throw new ValueError()
    }
    this.accountOpend = true
    this._balance = 0;
  }

  close() {
    if (!this.accountOpend) {
      throw new ValueError()
    }
    this.accountOpend = false
  }

  deposit(amount) {
    if (!this.accountOpend || amount < 0) {
      throw new ValueError()
    }
    this._balance = this._balance + amount
    return this.balance
  }

  withdraw(amount) {
    if (amount > this._balance || amount < 0) {
      throw new ValueError()
    }
    this._balance = this._balance - amount
  }

  get balance() {
    if (!this.accountOpend) {
      throw new ValueError()
    }
    return this._balance
  }
}

export class ValueError extends Error {
  constructor() {
    super('Bank account error');
  }
}
