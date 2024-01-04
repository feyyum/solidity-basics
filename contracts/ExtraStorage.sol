// SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import "./SimpleStorage.sol";

// Inheritance
contract ExtraStorage is SimpleStorage {

    // Override
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}