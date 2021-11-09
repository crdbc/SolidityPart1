// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Score {
    
    struct User {
        address addr;
        uint score;
    }

    User usr;
    mapping(address => uint) score_list;
    event Score_Set(uint);
    
    constructor(){
        usr.addr = msg.sender;
    }
    
    modifier onlyOwner{
        if(msg.sender == usr.addr){
            _; // execute remainder of function
        }
    }
    
    function getUserScore(address _user) public view returns (uint){
        return score_list[_user];
    }
    
    function getScore() public view returns(uint){
        return usr.score;
    }
    
    function setScore(uint _newScore) public onlyOwner{
        usr.score = _newScore;
        score_list[usr.addr] = usr.score; // Will only ever be the contract owner address
        emit Score_Set(_newScore);
    }
    
}
