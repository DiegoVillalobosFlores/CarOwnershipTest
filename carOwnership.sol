pragma solidity ^0.4.19;
contract CarOwnership{
    struct Owner{
        address ownership;
        string plate;
        string name;
    }
    
    Owner[] owners;
    
    function CarOwnership(string plate, string name) public {
        owners.push( Owner(msg.sender,plate,name));
    }
    
    function getCurrentOwner() public constant returns(address _currentOwner){
        _currentOwner =  owners[owners.length-1].ownership;
    }
    
    function transferOwnership(address to, string name) public{
        require(msg.sender == getCurrentOwner());
        var currentOwnerPlate = owners[owners.length-1].plate;
        owners.push(Owner(to,currentOwnerPlate,name));
    }
    
    function getOwnerName() public constant returns(string _currentOwnerName){
        _currentOwnerName = owners[owners.length-1].name;
    }
    
    function changePlate(string plate) public {
        require(msg.sender == getCurrentOwner());
        Owner storage owner = owners[owners.length-1];
        owner.plate = plate;
    }
    
    function getCurrentPlate() public constant returns(string _currentOwnerPlate){
        _currentOwnerPlate = owners[owners.length-1].plate;
    }
}
