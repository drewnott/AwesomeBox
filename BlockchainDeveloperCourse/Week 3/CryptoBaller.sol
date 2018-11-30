pragma solidity ^0.5.0;

import './ERC721.sol';

contract CryptoBallers is ERC721 {

    struct Baller {
        string name;
        uint level;
        uint offenseSkill;
        uint defenseSkill;
        uint winCount;
        uint lossCount;
    }

    address owner;
    Baller[] public ballers;
    

    // Mapping for if address has claimed their free baller
    mapping(address => bool) claimedFreeBaller;

    // Fee for buying a baller
    uint ballerFee = 0.10 ether;

    /**
    * @dev Ensures ownership of the specified token ID
    * @param _tokenId uint256 ID of the token to check
    */
    modifier onlyOwnerOf(uint256 _tokenId) {
        require(ownerOf(_tokenId) == msg.sender, "Owner of Taken Only!");
        _;
    }

    /**
    * @dev Ensures ownership of contract
    */
    modifier onlyOwner() {
       require(msg.sender == owner, "Owner of Game Ownly!");
        _;
    }

    /**
    * @dev Ensures baller has level above specified level
    * @param _level uint level that the baller needs to be above
    * @param _ballerId uint ID of the Baller to check
    */
    modifier aboveLevel(uint _level, uint _ballerId) {
      require(ballers[_ballerId].level > _level," Level Too Low.");
    
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    /**
    * @dev Allows user to claim first free baller, ensure no address can claim more than one
    */
    function claimFreeBaller() public {
        require(!claimedFreeBaller[msg.sender], "Only free baller per person.");
        _createBaller("Baller", 1, 1, 1); //Allows msg.sender to claim a free baller and select the name
        claimedFreeBaller[msg.sender] = true;
    }

    /**
    * @dev Allows user to buy baller with set attributes
    */
    function buyBaller() public payable {
        require (msg.value > ballerFee, "The fee is 0.1 ether."); 
        owner.transfer(msg.value);//Transfer money to contract address
        _createBaller("Bought Baller", 1, 1, 1);
    }

    /**
    * @dev Play a game with your baller and an opponent baller
    * If your baller has more offensive skill than your opponent's defensive skill
    * you win, your level goes up, the opponent loses, and vice versa.
    * If you win and your baller reaches level 5, you are awarded a new baller with a mix of traits
    * from your baller and your opponent's baller.
    * @param _ballerId uint ID of the Baller initiating the game
    * @param _opponentId uint ID that the baller needs to be above
    */
    function playBall(uint _ballerId, uint _opponentId) onlyOwnerOf(_ballerId) public {
        require ();
       // TODO add your code
    }

    /**
    * @dev Changes the name of your baller if they are above level two
    * @param _ballerId uint ID of the Baller who's name you want to change
    * @param _newName string new name you want to give to your Baller
    */
    function changeName(uint _ballerId, string calldata _newName) external aboveLevel(2, _ballerId) onlyOwnerOf(_ballerId) {
        ballers[_ballerId].name = _newName;
    }

    /**
   * @dev Creates a baller based on the params given, adds them to the Baller array and mints a token
   * @param _name string name of the Baller
   * @param _level uint level of the Baller
   * @param _offenseSkill offensive skill of the Baller
   * @param _defenseSkill defensive skill of the Baller
   */
    function _createBaller(string memory _name, uint _level, uint _offenseSkill, uint _defenseSkill) internal {
       Baller memory baller; //Creates Baller object
       baller.name = _name; //Sets Baller name
       baller.level = _level; //Sets Baller level
       baller.offenseSkill = _offenseSkill; //Sets Baller offenseSkill
       baller.defenseSkill = _defenseSkill; // Sets Baller defenseSkill
       baller.winCount = 0; //Sets Baller win count
       baller.lossCount = 0; //Sets Ball loss count
       ballers.push(baller); //Adds new Baller to array of ballers
       
       _mint(msg.sender, ballers.length); //Creates NFT associated with baller and msg.sender
    }

    /**
    * @dev Helper function for a new baller which averages the attributes of the level, attack, defense of the ballers
    * @param _baller1 Baller first baller to average
    * @param _baller2 Baller second baller to average
    * @return tuple of level, attack and defense
    */
    function _breedBallers(Baller memory _baller1, Baller memory _baller2) internal pure returns (uint, uint, uint) {
        uint level = _baller1.level.add(_baller2.level).div(2);
        uint attack = _baller1.offenseSkill.add(_baller2.offenseSkill).div(2);
        uint defense = _baller1.defenseSkill.add(_baller2.defenseSkill).div(2);
        return (level, attack, defense);

    }
}
