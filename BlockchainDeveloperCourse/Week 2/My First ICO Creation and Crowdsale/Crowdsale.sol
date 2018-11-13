pragma solidity ^0.4.24;

import "./IERC20.sol";
import "./SafeMath.sol";
import "./ERC20.sol";

contract Crowdsale is ERC20 {
    using SafeMath for uint256;

    uint256 private cap = 100000000000000000000*1 ether; // maximum amount of ether to be raised
    uint256 private weiRaised = 0; // current amount of wei raised

    uint256 private rate ; // price in wei per smallest unit of token (e.g. 1 wei = 10 smallet unit of a token)
    address private wallet; // wallet to hold the ethers
    IERC20 private token; // address of erc20 tokens

    event TokensPurchased(
        address indexed purchaser,
        address indexed beneficiary,
        uint256 value,
        uint256 amount
    );

   constructor(uint256 _rate, address _wallet, IERC20 _token) public {
       rate = _rate;
       wallet = _wallet;
       token = _token;
       //Creates objects for user input
    }
   
    function() external payable {
       buyTokens(msg.sender);
    }

    function buyTokens(address beneficiary) public payable {
        require(!capReached(),"We're sorry; the token limit for this ICO has been reached");
        if(msg.value > cap)
            cap = msg.value;    //What company turns down more money ?
        wallet.transfer(msg.value); //Forwards ether from by msg.sender to the wallet
        token.transfer(beneficiary,msg.value*rate); // Transfer tokens to beneficiary wallet
        weiRaised += msg.value; //Update ICO weiRaised
        emit TokensPurchased(msg.sender,beneficiary,msg.value,msg.value*rate);
    }

    function capReached() public view returns (bool) {
        if (weiRaised == cap)
        return true;
        else
        return false;
    }


}

