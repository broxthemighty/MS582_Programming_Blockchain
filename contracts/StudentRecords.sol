// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0; //tells the compiler we are using solidity

contract StudentRecords {

    enum Grade {Kindergarten, Primary, Secondary, HighSchool, College} //think about these as numbers in an array 0-4

    struct Student {
        uint256 id;
        string name;
        uint8 age;
        Grade grade;
        address Address;
    }

    uint256 private studentCounter;

    mapping(uint256 => Student) private students;

    event StudentAdded(uint256 id, string name);

    function addStudent(string memory _name, uint8 _age, Grade _grade, address _address) public {
        
        require(bytes(_name).length > 0, "No name data.");
        require(_age > 0, "Age must be greater than 0.");
        require(_address != address(0), "Invalid zero address");
        require(uint8(_grade) >= uint8(Grade.Kindergarten) && uint8(_grade) <= uint8(Grade.College), "Invalid grade.");

        studentCounter++;

        students[studentCounter] = Student({
            id: studentCounter,
            name: _name,
            age: _age,
            grade: _grade,
            Address: _address
        });

        emit StudentAdded(studentCounter, _name);
    }

    function getStudent(uint256 _id) public view returns (string memory, uint8, Grade, address) {
        Student storage student = students[_id];

        require(student.id != 0, "Student does not exist");

        return (student.name, student.age, student.grade, student.Address);
    }
}