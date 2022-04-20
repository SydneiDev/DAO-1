// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Treasury is Ownable {
    uint256 public totalFunds;
    address public payee;
    bool public isReleased;

    constructor(address _payee) payable {
        totalFunds = msg.value;
       // beneficiário
        payee = _payee;
        isReleased = false;
    }

// apenas o owner pode chamar este contrato
    function releaseFunds() public onlyOwner {
        isReleased = true;
        payable(payee).transfer(totalFunds);
    }
}
