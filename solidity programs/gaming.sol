// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;

contract TicketBooking {
bool[21]  seats;
address public owner;

    constructor() {
        owner = msg.sender; 
    }

 mapping(address => uint[]) public bookedSeatsByAddress;
 function bookSeats(uint[] memory seatNumbers) public {
     require(seatNumbers.length > 0 && seatNumbers.length <=4, "No seats specified for booking.");
      bool[21] memory tempBookingStatus;
       for (uint i = 0; i < seatNumbers.length; i++) {
             uint seatNumber = seatNumbers[i];
              if(msg.sender == owner && seatNumber == 20) {
                revert("Owner cannot book seat 20.");
            }
        require(seatNumber >= 1 && seatNumber <= 20, "Invalid seat number.");
        require(!seats[seatNumber], "One or more seats already booked.");
        require(!tempBookingStatus[seatNumber], "Duplicate seat number provided.");
        tempBookingStatus[seatNumber] = true;
         bookedSeatsByAddress[msg.sender].push(seatNumber);
        seats[seatNumber] = true;
        }

 }
 function showAvailableSeats() public view returns (uint[] memory) {
 uint count = 0;
        for (uint i = 1; i <= 20; i++) {
            if (!seats[i]) {
                count++;
            }
        }
        
        uint[] memory available = new uint[](count);
        uint j = 0;
        for (uint i = 1; i <= 20; i++) {
            if (!seats[i]) {
                available[j++] = i;
            }
        }
        return available;
    }

 

 function checkAvailability(uint seatNumber) public view returns (bool) {
      require(seatNumber >= 1 && seatNumber <= 20, "Invalid seat number.");
        return !seats[seatNumber];
 }
    
   
    function myTickets() public view returns (uint[] memory) {
    uint[] memory booked = bookedSeatsByAddress[msg.sender];
    return booked;
}
}
