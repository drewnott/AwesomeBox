pragma solidity ^0.4.25;


 import "./BaseAuction.sol";
 import "./Withdrawable.sol";
    
    contract TimerAuction is BaseAuction,Withdrawable{
        
        string public item;
        uint public auctionEnd; //Time Auction ended
        bool public end;        //Whether the auction has ended(true or false)
        uint public maxBid;     //Amount of highest bid in the auction
        address public maxBidder; //Identity of MaxBidder(Recall ID is given by Address)
        
   constructor(string _item, uint _durationMinutes) public 
   {
    item = _item; //Initializing item and auctionEnd variables
    auctionEnd = now + (_durationMinutes * 1 minutes);
   }
   function bid () external payable
    {
    require(now < auctionEnd && msg.value > maxBid); //Restricts bids to be done during auction
                                                    //and when bid to be placed is greater than max bid

             // Step 3
    if (maxBidder != address(0)) {
    pendingWithdrawals[maxBidder] += maxBid; //Maps max bid to respective bidder 
    }

    // Step 4
    maxBidder = msg.sender; //Assigns max bidder's current address if latter is true
    maxBid = msg.value; // . . . current bid to max bid variable

    emit BidAccepted(maxBidder, maxBid); // Records event in Ethereum log (i.e address of user in event and amount of bid)
    }
            
    function end() external ownerOnly 
    {
    // Check that time has expired and can only end once
    require(!end);
    require(now >= auctionEnd);

    // Update internal states and transfer ether to owner
    end = true;
    owner.transfer(maxBid);

    emit AuctionComplete(maxBidder, maxBid); //Records auction winner in Ethereum log (i.e address of winner and amount of bid)
    }
    }
    
    }
    
