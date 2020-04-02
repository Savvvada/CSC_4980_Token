# CSC_4980_Token
Within this repository lies a ERC20 Token Smart Contract and its Crowdsale Smart Contract. The purpose of these Smart Contracts is to display the ability and flexibility of the tools: Truffle, OpenZeppelin, and Solidity to create a ICO tfor whatever purpose one designs it for. I aspire to display my understanding of the Solidity language through this project and explain the methodology undertaken in its creation, step by step so one can reproduce the Smart Contracts. Foremost, to start the Crowdsale the necessary steps are as follows. Presumably one would have Ganache installed on their machine, in Linux, after installing Ganache and ensuring its dependencies are met, all one needs to do to initiate it, is type “ ganache-cli”. The purpose of Ganache is to create a testable blockchain with which one can deploy smart contracts, and make transfers with their ERC20 coin free of charge. After Gnaache is up and running, there are multiple ways one can then compile truffle. The method used in this project was through visual studio, after opening the folder of the project in Visual Studio, as truffle was already initialized in the folder, inside the Visual Studio folder one can type “truffle migrations –reset”. This is one way of deploying the contracts. 

Questions

Part a.
Q1) Change the minimum contribution to 7 Ether.
A1) To alter the minimum contribution, one needs to know what type of crowdsale they are running. Being that the Crowdsale is capped, there is a limit to how many contributions there can be, however no set minimum per investor. Therefore, one must initialize a variable with the value of the minimum contribution.  This was done in the file named “GSUCrowdsale.sol”, the variable’s name is “investorMinCap”. Subsequently, one must formulate thte necessary logic to ensure that the variable functions as a mandatory minimum within the contract.  This is seen within the “_preValidatePurchase” function.

Q2) Add method GetTokensLeft.
A2)  The method GetTokensLeft hinges on two public variables accessible by any function throughout the contract. The two variables are “tokensavailable” and “tokensSold”, the difference between the two, divided by the equivalent  of an ether returns the amount of tokens left.


Part B.
Q1)  To buy tokens from the crowdsale the function “buyTokens” was called from the “2_deploy_contracts” JavaScript file.  The first purchase was supposed to result in at least a final cost of 2.5 ether being seen in Ganache however despite writing the function call, values did not change.

Q2)The second function call was to make a purchase of 15 ether from the crowdsale but like the first one, things did not go as wished, and although deployment of the js file happened no observable change was seen in the Linux distribution of Ganache.
