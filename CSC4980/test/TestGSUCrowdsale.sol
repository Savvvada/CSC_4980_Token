pragma solidity ^0.5.16

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/GSUCrowdsale.sol";

contract TestGSUCrowdsale {
    //
    GSUCrowdsale gsusale = GSUCrowdsale(DeployedAddresses.GSUCrowdsale());
    
    //The owner of the contract
    address saleOwner = address(this);

    gsusale.buyTokens(web3.eth.accounts[1], {value : web3.utils.toWei("70000000000000000000", 'ether'), from : web3.eth.accounts[1]});
    gsusale.buyTokens(web3.eth.accounts[1], {value : new web3.utils.toWei("1500", 'ether') , from : web3.eth.accounts[1]});
    gsusale.buyTokens(web3.eth.accounts[1], {value : new web3.utils.toWei("1500", 'ether') , from : web3.eth.accounts[1]});

}