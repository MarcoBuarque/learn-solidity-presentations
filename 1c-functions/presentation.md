---
marp: true
---

## FUNctions 🕺

You can't spell functions without **fun**! 😆 And you must know the keywords 🔑

```js
contract Example {
  function example1() private pure {
    // private: call me within this contract
    // pure: I cannot read/write to storage
  }
  function example2() internal view {
    // internal: call me within this contract (+ inheritance!)
    // view: I can read from storage, not write
  }
  function example3() public payable {
    // public: call me inside and outside this contract
    // payable: send me some ether!
  }
  function example4() external {
    // external: call me from outside this contract
  }
}
```

---

## Returning values

```js
contract Example {
  uint public sum;

  constructor(uint x, uint y) {
    sum = add(x, y);
  }

  function add(uint x, uint y) private pure returns(uint) {
    return x + y;
  }
}
```

view functions don't cost any gas when they're called externally by a user.

This is because view functions don't actually change anything on the blockchain – they only read the data. So marking a function with view tells web3.js that it only needs to query your local Ethereum node to run the function, and it doesn't actually have to create a transaction on the blockchain (which would need to be run on every single node, and cost gas).

Note: If a view function is called internally from another function in the same contract that is not a view function, it will still cost gas. This is because the other function creates a transaction on Ethereum, and will still need to be verified from every node. So view functions are only free when they're called externally.