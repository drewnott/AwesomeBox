pragma solidity ^0.4.25;


contract Election {         //Creates Smart Contract on Ethereum called "Election"
    address public owner;
    string public name;

    event ElectionResult(string candidateName, uint voteCount);
    
    modifier ownerOnly() {
        require(msg.sender == owner, "Authorized Officials Only");
        _;
    }
    modifier eligible() {
        require(voters[msg.sender].authorized,"Ineligible to Vote"); 
        require(!voters[msg.sender].voted, "No double voting"); //The default value of a boolean is a null value or fasle
        _;
    }
    struct Candidate {
    string name;
    uint voteCount;
    }
    struct Voter {
    bool authorized;
    bool voted;
    uint vote;
    }
    
    Candidate[] public candidates;
    mapping(address => Voter) public voters;

    constructor(string _name, string _candidate1, string _candidate2) public {
        owner = msg.sender;
        name = _name;
        candidates.push(Candidate(_candidate1, 0));
        candidates.push(Candidate(_candidate2, 0));
        //Drop for add candidate function
    }

    function authorize(address _voter) public ownerOnly {
        require(!voters[_voter].authorized, "No Double Voting!");
        voters[_voter].authorized = true;
    }

    function vote(uint _candidate) public eligible{
        require(_candidate < candidates.length, "Invalid Candidate"); //Candidate numbers from 0 to n are a bit unintuitive. Adjust later
                                                                        //How can I move this line to eligible()?
        voters[msg.sender].vote = _candidate;
        voters[msg.sender].voted = true;
        candidates[_candidate].voteCount += 1;
    }

    function end() public ownerOnly {
        // Emit event for each candidates results
    for(uint i=0; i < candidates.length; i++){
        emit ElectionResult(candidates[i].name, candidates[i].voteCount);
     }
    }
    
}
//Programs runs but it doesn't a person vote after authorization. Revisit
