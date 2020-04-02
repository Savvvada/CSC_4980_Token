const CSC4980_Token = artifacts.require("CSC4980_Token");
const CSC4860Crowdsale = artifacts.require("CSC4860TokenCrowdsale");

module.exports = async function(deployer, network, accounts) {
  //const rate = 1000;
  //const wallet = accounts[1];
  //const Web3 = require('web3')
  //const token = CSC4980_Token
  //const CSC4860Crowdsale = web3.eth.Contract(contract_abi, contract_address);

  deployer.deploy(CSC4980_Token, 
    "CSC4980_Token", 
    "GSU", 
    16 ).then((t) => {token = t;}).then(function(){deployer.deploy(CSC4860Crowdsale, 
      1000, 
      accounts[1], 
      CSC4980_Token.address, 
      web3.utils.toWei("350", 'ether'));});

  
      
  //await CSC4860Crowdsale.deployed.then().token.transferOwnership(CSC4860Crowdsale.address)

 
};
