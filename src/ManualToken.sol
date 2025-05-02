// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract ManualToken {
    mapping(address => uint256) private s_balance;

    function name() external pure returns (string memory) {
        return "Manual Token";
    }

    function symbol() external pure returns (string memory) {
        return "MT";
    }

    function decimal() external pure returns (uint8) {
        return 18;
    }

    function totalSupply() external pure returns (uint256) {
        return 100 ether; //100000000000000000000
    }

    function balanceOf(address _user) external view returns (uint256) {
        return s_balance[_user];
    }

    function transfer(address _to, uint256 _amount) external returns (bool) {
        uint256 totalBalance = s_balance[msg.sender] + s_balance[_to];
        s_balance[msg.sender] -= _amount;
        s_balance[_to] += _amount;
        require(totalBalance == s_balance[msg.sender] + s_balance[_to], "Transfer failed");
        return true;
    }
}
