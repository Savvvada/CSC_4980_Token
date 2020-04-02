pragma solidity ^0.5.16;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";

contract CSC4980_Token is ERC20Mintable, ERC20Detailed {
//Explicit data location for all variables of struct, array or mapping types is mandatory, except for uint8

    constructor(string memory _name , string memory _symbol , uint8 _decimals)
    ERC20Detailed(_name, _symbol, _decimals)
    public{
        
    }
}