// contracts/InaraToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract InaraToken is ERC20, AccessControl {
    // define access control roles
    bytes32 public constant SENDER_ROLE = keccak256("SENDER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    constructor(address sender_address, address burner_address, uint256 initialSupply) public ERC20("Inara Token", "INA") {
        // mint tokens to the master wallet account
        _mint(msg.sender, initialSupply);
        // set up roles
        _setupRole(SENDER_ROLE, sender_address);
        _setupRole(BURNER_ROLE, burner_address);
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

    /*
    Send "to" address "amount" Inara token.
    Used to reward user for content contribution. 
    */
    function reward(address to, uint256 amount) public {
        // Check that the calling account has the sender role
        require(hasRole(SENDER_ROLE, msg.sender), "Caller is not an authorized sender");
        transfer(to, amount);
    }

    /*
    Burn "from" address "amount" Inara token.
    Used to decrease balance when user redeemed Inara Token for goods or services.
    */
    function burn(address from, uint256 amount) public {
        require(hasRole(BURNER_ROLE, msg.sender), "Caller is not a burner");
        _burn(from, amount);
    }
}