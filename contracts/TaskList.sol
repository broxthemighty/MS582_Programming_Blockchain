// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// Contract definition
contract TaskList {
    // Structure to represent a task
    struct Task {
        string description;
        bool completed;
    }

    // Dynamic array to store tasks
    Task[] public tasks;

    // Function to add a new task to the list
    function addTask(string memory _description) public {
        tasks.push(Task(_description, false));
    }

    // Function to mark a task as completed
    function completeTask(uint256 _index) public {
        require(_index < tasks.length, "Index out of bounds");
        tasks[_index].completed = true;
    }

    // Function to get the total number of tasks
    function getTaskCount() public view returns (uint256) {
        return tasks.length;
    }

    // Function to get the description and completion status of a task by index
    function getTask(uint256 _index) public view returns (string memory, bool) {
        require(_index < tasks.length, "Index out of bounds");
        return (tasks[_index].description, tasks[_index].completed);
    }
}