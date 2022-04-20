// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract Token is ERC20Votes {
    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _initialSupply
    ) ERC20(_name, _symbol) ERC20Permit(_name) {
        _mint(msg.sender, _initialSupply);
    }

/* The functions below are overrides required by Solidity.
 A function that allows an inheriting contract to override its 
behavior will be marked at virtual.
 The function that overrides that base function
 should be marked as override. */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }
/*
When having a contract A with a function f() 
that derives from B which also has a function f(), 

A overrides the f of B. That means that myInstanceOfA.f() 
will call the version of f that is implemented inside A itself, 
the original version implemented inside B is not visible anymore. 
The original function f from B (being A's parent) is thus available
 inside A via super.f(). 
 */
    function _mint(address to, uint256 amount) internal override(ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20Votes)
    {
        super._burn(account, amount);
    }
}
