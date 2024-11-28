// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0; 

contract Ownable {

    address owner;

    constructor() {
        owner = msg.sender;
    }
}

contract StudentManagement is Ownable {

    enum Grade {Kindergarten, Primary, Secondary, HighSchool, College}

    struct Student {
        uint256 id;
        string name;
        uint8 age;
        Grade grade;
        uint256 registeredAt;
    }

    uint256 private studentCounter;

    uint256 private currentTime;

    mapping(uint256 => Student) private students;

    event StudentRegistered(string name, uint256 registeredAt);

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function registerStudent(string memory _name, uint8 _age, Grade _grade) public onlyOwner {

        require(bytes(_name).length > 0, "No name data.");
        require(_age > 0, "Age must be greater than 0.");
        require(uint8(_grade) >= uint8(Grade.Kindergarten) && uint8(_grade) <= uint8(Grade.College), "Invalid grade.");

        studentCounter++;

        currentTime = block.timestamp; //I wanted one timestamp to use when referencing when the student was registered

        students[studentCounter] = Student({
            id: studentCounter,
            name: _name,
            age: _age,
            grade: _grade,
            registeredAt: currentTime
        });

        emit StudentRegistered(_name, currentTime);
    }

    function getStudent(uint256 _id) public view returns (string memory, uint8, Grade, uint256) {
        Student storage student = students[_id];

        require(student.id != 0, "Student does not exist");

        return (student.name, student.age, student.grade, student.registeredAt);
    }
}