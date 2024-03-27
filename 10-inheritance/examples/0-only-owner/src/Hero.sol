// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Enemy.sol";

abstract contract Hero {
	uint public health;
	uint public energy = 10;
	
	constructor(uint _health) {
		health = _health;
	}
	
	function takeDamage(uint damage) public {
		health -= damage;
	}
	
	enum AttackTypes { Brawl, Spell }
	function attack(Enemy) public virtual {}

	function attackWithEnergy(Enemy) public virtual {
		energy--;
	}
}