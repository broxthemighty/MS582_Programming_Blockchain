// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Contract definition
contract EmployeeRegistry {
    // Enum to represent the department of an employee
    enum Department {HR, Engineering, Marketing, Finance}

    // Structure to represent an employee
    struct Employee {
        string name;
        uint256 age;
        Department department;
    }

    // State variables
    mapping(address => Employee) public employees; // Mapping to store employees by their addresses
    address[] public employeeAddresses; // Array to store addresses of all employees

    // Function to add a new employee
    function addEmployee(address _address, string memory _name, uint256 _age, Department _department) public {
        employees[_address] = Employee(_name, _age, _department);
        employeeAddresses.push(_address);
    }

    // Function to get the details of an employee
    function getEmployee(address _address) public view returns (string memory, uint256, Department) {
        Employee memory employee = employees[_address];
        return (employee.name, employee.age, employee.department);
    }

    // Function to get the total number of employees
    function getTotalEmployees() public view returns (uint256) {
        return employeeAddresses.length;
    }
}