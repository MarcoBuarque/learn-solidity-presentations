---
marp: true
---

## Storage Variables

Variables declared in contract scope are storage variables

- Tipo de variável persistente. Continuam existindo mesmo após uma transação ser realizada
- Guardar variáveis é caro, só faça isso se for realmente necessário

Solidity stores these in contiguous storage slots

```js
contract Example {
  uint256 a; // storage slot - 0x0
  uint256 b; // storage slot - 0x1
  bool public c; // storage slot - 0x2

  function store() external {
    // read storage slot 0x1
    // store it in storage slot 0x0
    a = b;

    // read storage slot 0x1
    // store it in memory (not persistent!)
    uint x = b;
  }
}
```

---

## Things to know about storage slots

- 🔭 variables stored in contract scope allocate a storage slot (except for `constant`)
- 📏 slots are 32 bytes (`0x1` means `0x000....001`)
- 🔢 solidity stores variables contiguously (`0x0`, `0x1`, etc...)
- 💸 reading/writing to storage is relatively super expensive to other opcodes
- 🎒 variables can be packed together, automatically or manually

Os valores pagos para o armazenamento ou para a leitura dependem de alguns fatores:
- A quantidade de slots que um dado usa (int256 = 1 slot, array = vários slots)
- "Dirty" vs. "clean" slot - changing a slot that has not yet been changed within the current execution context is more costly than changing a slot that has already been changed
// SSTORE - store to some storage location
// SLOAD - read from some storage location