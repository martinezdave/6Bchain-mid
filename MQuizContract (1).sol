// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SalaryCalculator {
address public owner;
uint256 public hourlyRate;
uint256 public hoursWorked;
uint256 public age;

modifier onlyOwner() {
require(msg.sender == owner, "Only the owner can call this function");
_;
}

constructor() {
owner = msg.sender;
}

function setAge(uint256 _age) external onlyOwner {
age = _age;
}

function setHrsWrk(uint256 _hoursWorked) external onlyOwner {
require(_hoursWorked > 0, "Hours worked must be greater than zero");
hoursWorked = _hoursWorked;
}

function setRate(uint256 _hourlyRate) external onlyOwner {
require(_hourlyRate > 0, "Hourly rate must be greater than zero");
hourlyRate = _hourlyRate;
}

function calculateTolSal() external onlyOwner view returns (uint256) {
require(hourlyRate > 0 && hoursWorked > 0, "Hourly rate and hours worked must be greater than zero");
return hourlyRate * hoursWorked;
}
}