// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{
    address payable owner;
    constructor(address _user) ERC20("Token", "TKN") {
        _mint(_user, 1000 * 10 ** decimals());
        owner=payable(msg.sender);
    }

    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }

    function bal() public view returns(uint balanceLeft) {
        return balanceOf(msg.sender);
    }


    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer_amount(address recipient, uint256 amount) public returns(bool){
        bool success = transfer(recipient, amount);
        return success;
    }
}