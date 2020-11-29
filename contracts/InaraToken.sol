// contracts/InaraToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract InaraToken is ERC20 {
    constructor(uint256 initialSupply) public ERC20("Inara Token", "INA") {
        // mint tokens to the master wallet account
        _mint(msg.sender, initialSupply);
    }
    /* The contract supports the following function:
    name()
    symbol()
    decimals()
    totalSupply()
    balanceOf(account)
    transfer(recipient, amount)
    allowance(owner, spender)
    approve(spender, amount)
    transferFrom(sender, recipient, amount)
    increaseAllowance(spender, addedValue)
    decreaseAllowance(spender, subtractedValue)  
    */
}