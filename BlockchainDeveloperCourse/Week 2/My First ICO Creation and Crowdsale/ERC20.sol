pragma solidity ^0.4.24;

import "./IERC20.sol";
import "./SafeMath.sol";

contract ERC20 is IERC20 {
  using SafeMath for uint256;

  mapping (address => uint256) internal _balances;
  mapping (address => mapping (address => uint256)) internal _allowed;
  uint256 internal _totalSupply;

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address owner) public view returns (uint256) {
   return _balances[owner];
  }
  
  function allowance(address owner, address spender) public view returns(uint256) {
      return _allowed[owner][spender];
  }
 
  function transfer(address to, uint256 value) public returns (bool) {
        require(_balances[msg.sender] >= value, "Insufficient Funds");
        to.transfer(value);
        _balances[msg.sender] -= value;
        _balances[to] += value;
        return true;
  }
  
  function approve(address spender, uint256 value) public returns (bool) {
    _allowed[msg.sender][spender] = value; //Sets Spender's Allowance
    return true;
  }
 
  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(approve(msg.sender,_allowed[from][msg.sender]) && _balances[from] >= value,"Insufficient Funds");
    to.transfer(value);
    _allowed[from][msg.sender] -= value; //Updates Spender's Allowance
    _balances[to] += value;
    _balances[owner]
    return true;
  }

  
}
