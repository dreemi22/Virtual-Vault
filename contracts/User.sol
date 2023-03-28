// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract User
{
    struct UserDetails
    {
        uint256 phonenumber;
        string username;
        string[] cids;
    }

    mapping(address => UserDetails) users;

    function registerUser(string memory name, uint256 phonenumber, string[] memory cid)public{
        users[msg.sender] = UserDetails(phonenumber, name, cid);
    }
    
    function getUser(address walletAddress) public view returns (uint256 number, string memory name, string[] memory cids){
        number = users[walletAddress].phonenumber;
        name = users[walletAddress].username;
        cids = users[walletAddress].cids;
    }
}