pragma solidity >=0.5.16;

contract Election {
    struct Candidate {
        uint id;
        string name;
        string party;
        uint voteCount;
    }
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;
    event votedEvent (
        uint indexed _candidateId
    );
    constructor () public {
        addCandidate("UPES","Bharatiya Janata Party");
        addCandidate("Abhirup Sir","Indian National Congress");
        addCandidate("Molshree Gupta","Samajvadi Party");
        addCandidate("Naman Shankhdhar","All India Trinamool Congress");
        addCandidate("Shreya Arora","Bahujan Samaj Party");
        addCandidate("NOTA","None of the above");
    }
    function addCandidate (string memory name,string memory party) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, name,party, 0);
    }
    function vote (uint _candidateId) public {
        require(!voters[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++;
        emit votedEvent(_candidateId);
    }
}
