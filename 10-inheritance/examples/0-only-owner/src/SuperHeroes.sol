// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";


contract Mage is Hero(50) {
	function attack(Enemy enemy) public override {
        enemy.takeAttack(Hero.AttackTypes.Spell);
        super.attackWithEnergy(enemy);
    }

    function attackWithEnergy(Enemy enemy) public override {
        enemy.takeAttack(Hero.AttackTypes.Spell);
        super.attackWithEnergy(enemy);
    }
}

contract Warrior is Hero(200) {
    function attack(Enemy enemy) public override {
        enemy.takeAttack(Hero.AttackTypes.Brawl);
    }

    function attackWithEnergy(Enemy enemy) public override {
        enemy.takeAttack(Hero.AttackTypes.Brawl);
        super.attackWithEnergy(enemy);
    }
}
