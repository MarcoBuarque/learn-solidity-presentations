---
marp: true
---

# Message Calls

- Send value and `calldata` to contracts
- The first message call is the beginning of the transaction (EOA -> contract)
- Each subsequent message call is part of the same transaction (contract -> contract)
- The transaction and any state changes only complete when the initial function call finishes execution

---

![message-call](imgs/message-call.png)

---

## Message Call Breakdown

- As we saw message calls can contain `gas`, `value` and `calldata`
- These message values become available as globals in solidity:

  - `msg.sender` - who made the last message call
  - `msg.value` - amount in wei sent
  - `msg.data` - calldata
  - `msg.sig` - the function identifier

---

## How Do EOAs and Contracts Call Other Contracts?

- They use the `address` of the contract they want to communicate with
- This is a data type in solidity that is 20 bytes long
- The `msg.sender` from the previous slide is an address

---

## What does that look like?

```js
contract X {
  address deployer;
  address otherContract;

  constructor(address _otherContract) {
    deployer = msg.sender;
    otherContract = _otherContract;
  }
}
```

---

## Can any method call receive ether?

Only `payable` methods can:

```js
contract X {
  receive() external payable {
    // no calldata necessary here
    // just send a value on the message call
  }

  function pay() external payable {
    // in this case, we target pay with a value
  }
}
```
receive: um método especial tipo o constructor. Ele é invocado quando algum valor em ether é enviado para o smartcontract, mas na message call não foi especificado nenhum método ou o método especificado não existe (tipo um default)
pay: o valor em eth que vc está enviando para o contrato será adicionado automaticamente no saldo do contrato

---

## What does sending value look like?

The `.call` syntax is `.call{ gas, value }(calldata)`

```js
contract X {
  address otherContract;

  constructor(address _otherContract) payable {
    otherContract = _otherContract;
    _otherContract.call{ value: msg.value }("");
  }
}
```
```js
contract MyContract {

  function callOtherContract(address targetContract, bytes memory data) public payable {
    (bool success, bytes memory returnData) = targetContract.call{gas: 200000, gasPrice: 100 gwei, value: 1 ether}(data);
    // Handle success and returnData
  }
}
```


---

## Handle the success

The solidity compiler will warn you if you don't handle `success`

```js
contract X {
  address otherContract;

  constructor(address _otherContract) payable {
    otherContract = _otherContract;
    (bool success, ) = _otherContract.call{ value: msg.value }("");
    require(success);
  }
}
```

o que é message call ?é o ato de passar uma mensagem de um ator (eoa ou smart contract) para outro ator (eoa ou smart contract). Sendo que uma mensagem é um conjunto de dados (data) e valores (ether)que é passado entre duas accounts.
Vale ressaltar que eoa e smart contract são visto como accounts (user account e contract account)
An address on the EVM is a 160 bits long, or a 40 character, hexadecimal string