// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorage;

    function createSimpleStorageContract() public {
        // How does StorageFactory know what simple storage looks like?
        simpleStorage.push(new SimpleStorage());
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        simpleStorage[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return simpleStorage[_simpleStorageIndex].retrieve();
    }

}