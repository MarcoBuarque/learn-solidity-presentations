---
marp: true
---

# Solidity Value Types

Let's look at a few important types

```js
contract Example {
  uint a;
  int b;
  bool c;

  enum Choice { Up, Down, Left, Right }
  Choice choice = Choice.Up;
}
```

---

**Unsigned Integer**: A number without a sign (not positive or negative)

```js
contract Example {
  // uint can be declared in steps of 8
  // where the number represents the number of bits
  uint8 x; // 0 -> 255
  uint16 y;

  // uint is an alias for uint256
  uint z1;
  uint256 z2;
}
```

---

**Integer**: A number that could be either positive or negative

```js
contract Example {
  // uint can be declared in steps of 8
  // where the number represents the number of bits
  int8 x; // -128 -> 127
  int16 y;

  // int is an alias for int256
  int z1;
  int256 z2;
}
```

---

**Boolean**: Either `true` or `false`

```js
import "forge-std/console.sol";

contract Example {
  constructor(bool myCondition) {
    if(myCondition) {
      // will log yay if myCondition is true
      console.log("yay!");
    }
  }
}
```

---

**Enum**: Defining options for a value by name

```js
import "forge-std/console.sol";

contract Example {
  enum Choice { Up, Down, Left, Right }

  constructor(Choice choice) {
    if(choice == Choice.Up) {
      console.log("up");
    }
    if(choice == Choice.Down) {
      console.log("down");
    }
  }
}
```

**String**:
```js
bytes msg1 = "Hello World"; 
string msg2 = "Hello World";
```
For a long human-readable message it is recommended to use string since it will be easier to read the values from the blockchain storage from the outside (like for a front-end application)
If the string is shorter than 32 bytes, it is more efficient to store it in a fixed-size byte array like bytes32. This simplifies the computation since the memory is allocated ahead of time. On the other hand, both string and bytes will allocate their memory dynamically depending on the size of the string.