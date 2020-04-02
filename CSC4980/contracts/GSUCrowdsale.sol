pragma solidity ^0.5.16;


import "openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
//import "../build/contracts/CSC4980Token.sol";


contract CSC4980TokenCrowdsale is Crowdsale, MintedCrowdsale, CappedCrowdsale{

	using SafeMath for uint256;
	using SafeERC20 for ERC20;

	//minimum investor Contribution - 7 ether
	uint256 public investorMinCap = 70000000000000000000;
	uint256 public investorHardCap = 500000000000000000000;
	uint256 private tokenSold = 0;
	uint256 private tokensavailable = 0;

	event TokenPurchase(
    address indexed purchaser,
    address indexed beneficiary,
    uint256 value,
    uint256 amount
	);
	
	mapping(address => uint256) public contributions;

	constructor(
		uint256 _rate,
		address payable _wallet,
		ERC20 _token,
		uint256 _cap
		)	

	Crowdsale(_rate, _wallet, _token)
	CappedCrowdsale(_cap)
	public{
	tokensavailable = _cap*_rate;

	}
	
	function () external payable {
    buyTokens(msg.sender);
	}
	function getTokensLeft() view public returns (uint256) {
		return (tokensavailable - tokenSold) / 1000000000000000000;
	}
	function buyTokens(address _beneficiary) public payable {
		uint256 weiAmount = msg.value;
    	_preValidatePurchase(_beneficiary, weiAmount);
		uint256 tokens = _getTokenAmount(weiAmount);
		_processPurchase(_beneficiary, tokens);
    	emit TokenPurchase(
    	msg.sender,
    	_beneficiary,
    	weiAmount,
    	tokens
    );
	_updatePurchasingState(_beneficiary, weiAmount);

	_forwardFunds();
    	_postValidatePurchase(_beneficiary, weiAmount);
	}

	function _preValidatePurchase( address _beneficiary, uint256 _weiAmount ) internal view
  {
    super._preValidatePurchase(_beneficiary, _weiAmount);
	uint256 _existingContribution = contributions[_beneficiary];
  	uint256 _newContribution = _existingContribution.add(_weiAmount);
	require(_newContribution >= investorMinCap && _newContribution <= investorHardCap);
	}

	function _updatePurchasingState(address _beneficiary,uint256 _weiAmount) internal
	{
    // optional override
	}
	

}