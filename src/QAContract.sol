// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract QAContract {
    uint256 public value;

    event ValueChanged(uint256 newValue, address changer);

    function setValue(uint256 _newValue) public {
        value = _newValue;
        emit ValueChanged(_newValue, msg.sender);
    }
}
