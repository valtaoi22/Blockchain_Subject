// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract VotingSystem {
    struct Candidate {
        uint id;
        string name;
        uint age;
        string sex;
        uint income;
        uint voteCount;
    }
    Candidate[] public candidates;
    constructor() {
        // Add 3 to 4 candidates
        candidates.push(Candidate(0, "Vaneet", 20, "Male", 50000, 1));
        candidates.push(Candidate(1, "Girish", 21, "Female", 75000, 1));
        candidates.push(Candidate(2, "Sumit", 54, "Male", 35000, 0));
        // You can add more candidates as needed
    }

    function getCandidates() public view returns (Candidate[] memory) {
        // Return the candidate array
        return candidates;
    }

    function vote(uint candidateId) public {
        // Find the candidate with the given ID
        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].id == candidateId) {
                // Increment the candidate's vote count
                candidates[i].voteCount++;
                break;
            }
        }
    }

    function getResult() public view returns (string memory) {
        string memory result = "";
        for (uint i = 0; i < candidates.length; i++) {
            // Concatenate the candidate name and vote count
            result = string(abi.encodePacked(result, candidates[i].name, ": ", toString(candidates[i].voteCount), "\n"));
        }
        return result;
    }

    // Helper function to convert uint to string
    function toString(uint value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint temp = value;
        uint digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
