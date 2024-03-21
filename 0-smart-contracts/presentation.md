---
marp: true
---

# Smart Contracts: A Blockchain Program

A smart contract is blockchain-deployed code. For example:

```js
contract Agreement {
  address recipient;
  bool conditionIsMet;

  function payout() external {
    if(conditionIsMet) {
      sendValue(recipient);
    }
  }

  // ...
}
```

---

## Deploying a Contract

1. ⚙️ compile your **solidity** to bytecode
2. ✉️ send a transaction containing the bytecode to an EVM node
3. 🏡 the node calculates an address for your new contract

---

## Contract Deployment

![deployment](imgs/contract-deployment.png)

---

| Opcode | Name | Description              | Gas |
| ------ | ---- | ------------------------ | --- |
| `0x00` | STOP | Halts execution          | 0   |
| `0x01` | ADD  | Addition operation       | 3   |
| `0x02` | MUL  | Multiplication operation | 5   |
| `0x03` | SUB  | Subtraction operation    | 3   |

https://ethereum.org/en/developers/docs/evm/opcodes/

A quantidade de gas gasto em uma operação é calculada de forma determinística. Então se uma mesma operação for realizada N vezes, a quantidade de gas gasta por cada uma dessas N operações será a mesma. Além disso, isso nos permite calcular a quantidade de gas que será gasto antes de realizar tal operação. 
O que varia é o preço que pagamos pela unidade de gás. Quando a rede está recebendo um volume maior de transações, o preço do gás tende a aumentar. Como uma quantidade finita de transações podem ser geradas em um bloco e cada bloco é gerado em um determinado espaço de tempo, temos uma quantidade finita de gás que pode ser gasto nesse intervalo de tempo, ai que entra a lei da oferta e da procura. 

---

## Key Takeaways

1. ⚙️ Contracts are compiled to creation bytecode
2. ⛓ The `data` field contains your creation bytecode
3. 📭 The `to` field is left blank to deploy a contract
4. 🏡 Your contract will have an address, balance and runtime bytecode

---

## Transaction Life Cycle

![communication](imgs/contract-communication.png)

---

## Key Takeaways

1. 🥾 Transactions begin at an EOA
2. ☝️ Transactions occur sequentially
3. ⛽️ Transactions set a gas limit
4. 🎯 Transactions send calldata, targetting a contract method
5. 🌐 Similarly smart contracts can call each other within the one transaction

gas price: quanto eu quero pagar por unidade de gas e gas limit: meu limite de unidades de gas posso usar para essa tx