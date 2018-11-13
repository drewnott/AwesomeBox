pragma solidity ^0.4.24;

import "./IERC20.sol";
import "./SafeMath.sol";
import "./ERC20.sol";

contract Crowdsale is ERC20 {
    using SafeMath for uint256;

    uint256 private cap = 100000000000000000000*1 ether; // maximum amount of ether to be raised
    uint256 private weiRaised = 0; // current amount of wei raised

    uint256 private rate = 100; // price in wei per smallest unit of token (e.g. 1 wei = 10 smallet unit of a token)
    address private wallet; // wallet to hold the ethers
    IERC20 private token; // address of erc20 tokens

   /**
    * Event for token purchase logging
    * @param purchaser who paid for the tokens
    * @param beneficiary who got the tokens
    * @param value weis paid for purchase
    * @param amount amount of tokens purchased
    */
    event TokensPurchased(
        address indexed purchaser,
        address indexed beneficiary,
        uint256 value,
        uint256 amount
    );

    // -----------------------------------------
    // Public functions (DO NOT change the interface!)
    // -----------------------------------------
   /**
    * @param _rate Number of token units a buyer gets per wei
    * @dev The rate is the conversion between wei and the smallest and indivisible token unit.
    * @param _wallet Address where collected funds will be forwarded to
    * @param _token Address of the token being sold
    */
    constructor(uint256 _rate, address _wallet, IERC20 _token) public {
       
        
    }
    //I wasn't really sure what I had to use this constructor.

    /**
    * @dev Fallback function for users to send ether directly to contract address
    */
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
        // Below are some general steps that should be done.
        // You need to decide the right order to do them in.
        //  - Validate any conditions
        //  - Calculate number of tokens
        //  - Update any states
        //  - Transfer tokens and emit event
        //  - Forward funds to wallet

        // TODO: Your Code Here
        emit TokensPurchased(msg.sender,beneficiary,msg.value,msg.value*rate);
    }

    /**
    * @dev Checks whether the cap has been reached.
    * @return Whether the cap was reached
    */
    function capReached() public view returns (bool) {
        require(weiRaised == cap, "Please continue to help us as we endevour to meet our goal");
        return true;
    }

    // -----------------------------------------
    // Internal functions (you can write any other internal helper functions here)
    // -----------------------------------------


}


