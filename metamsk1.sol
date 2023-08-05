// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract GetAddressAndBalance {
    function getAddressAndBalance() public view returns (address, uint256) {
        address addr = address(this);
        uint256 balance = addr.balance;
        return (addr, balance);
    }
}
