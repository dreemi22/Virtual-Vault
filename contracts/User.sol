// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract User
{
    struct UserDetails
    {
        string[]cids;
    }
    mapping(address => UserDetails) users;

    function userCids(string memory cid)public{
        users[msg.sender].cids.push(cid);
    }
    
    function getUserCids(address walletAddress) public view returns (string[] memory cids){
        cids = users[walletAddress].cids;
    }
}