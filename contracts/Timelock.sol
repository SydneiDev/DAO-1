// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/governance/TimelockController.sol";

contract TimeLock is TimelockController {
    constructor(
       // _minDelay para liberar os fundos após a proposta ser aprovada
        uint256 _minDelay,
// The proposers are in charge of scheduling (and cancelling) operations. This is a critical role, that should be given to governing entities. This could be an EOA, a multisig, or a DAO.
        address[] memory _proposers,
// The executors are in charge of executing the operations scheduled by the proposers once the timelock expires. Logic dictates that multisig or DAO that are proposers should also be executors in order to guarantee operations that have been scheduled will eventually be executed.
        address[] memory _executors
    ) TimelockController(_minDelay, _proposers, _executors) {}
}
