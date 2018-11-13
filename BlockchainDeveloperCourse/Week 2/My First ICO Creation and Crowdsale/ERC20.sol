pragma solidity ^0.4.24;

import "./IERC20.sol";
import "./SafeMath.sol";

contract ERC20 is IERC20 {
  using SafeMath for uint256;

  mapping (address => uint256) internal _balances;
  mapping (address => mapping (address => uint256)) internal _allowed;
  uint256 internal _totalSupply;
  
  modifier validDestination( address to ) {
        require(to != address(0x0),"Invalid address");
        require(to != address(this),"Invalid address" );
        _;
    }
    
  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address owner) public view returns (uint256) {
   return _balances[owner]; //Returns balance of address entered
  }
  
  function allowance(address owner, address spender) public view returns(uint256) {
      return _allowed[owner][spender]; //Returns spender's allowance set by owner 
  }
  
  function transfer(address to, uint256 value) public returns (bool) {
        require(to != address(0),"Invalid address");
        require(to != address(this),"Invalid address" );
        require(_balances[msg.sender] >= value, "Insufficient Funds");
        _balances[msg.sender] -= value; //Updates msg.sender's balance
        _balances[to] += value; //Updates recipient's balance
        return true;
  }
 
  function approve(address spender, uint256 value) public returns (bool) {
    _allowed[msg.sender][spender] = value; //Sets Spender's Allowance
    return true;
  }
  
  function transferFrom(address from, address to, uint256 value) public returns (bool) {
      //Note: "from" is the owner of the allowance, "to" is to whom the tokens are going
      // and the caller of the function(msg.sender) is approved spender 
    require(to != address(0),"Invalid address");
    require(to != address(this),"Invalid address" ); 
    require(approve(msg.sender,_allowed[from][msg.sender]),"Unathorized Access"); //The message sender must have approved spender to use their tokens
    require(value <= _balances[from],"Insufficient allowance"); //Owner of allowance must have funds in their account
    require(value <= _allowed[from][to], "The requested amount exceeds allowance");
    
    _balances[to] += value; //Tranfers value to receiver
    _allowed[from][msg.sender] -= value; //Updates msg.sender Allowance
    _balances[from] -= value;   //Update Owner of Allowance Wallet Balance
    return true;
  }

}
