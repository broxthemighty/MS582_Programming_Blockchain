// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

/**Created by Matt Lindborg
 * UAT MS582 Week 5
 * @title DecentralizedCrowdfunding
 * @dev acceptance, storage, and payout for funding of public projects
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract Crowdfunding {

    // Project Struct
    struct Project {
        uint256 id;
        string name;
        uint256 goalAmount;
        uint256 currentAmount;
        bool isActive;
    }

    // event for when a project is created
    event ProjectCreated(uint256 projectId, string name, uint256 goalAmount, address indexed creator);

    // event for when a contribution is made
    event ContributionMade(uint256 projectId, address indexed contributor, uint256 amount);

    // event for when a project is completed
    event ProjectCompleted(uint256 projectId);

    // commented out array version of projects.
    //Project[] projects;

    // map for the project collection
    mapping(uint256 => Project) private projects;

    // state variable for the project count in the map
    uint256 public projectCount = 0;

    // create the project and add it to the map
    function createProject(string memory _name, uint256 _goalAmount) public {
        
        // commented out array version of projects.
        /*projects.push(Project({
            id: projectCount,
            name: _name,
            goalAmount: _goalAmount,
            currentAmount: 0,
            isActive: true
            })); */

        Project memory newProject = Project({
            id: projectCount,
            name: _name,
            goalAmount: _goalAmount,
            currentAmount: 0,
            isActive: true
            });

        projects[projectCount] = newProject;

        emit ProjectCreated(projectCount, _name, _goalAmount, msg.sender);

        projectCount++;

    }

    // contribute currency to the project, if it exists and is active
    function contribute(uint256 _projectId) external payable {

        require(_projectId < projectCount, "Invalid project ID."); 
        Project storage project = projects[_projectId];
        require(project.isActive, "Project is not active.");
        require(msg.value > 0, "Contribution must be greater than 0.");


        project.currentAmount += msg.value;

        if(project.currentAmount >= project.goalAmount) {
            project.isActive = false;
            emit ProjectCompleted(_projectId);
        }

        emit ContributionMade(_projectId, msg.sender, msg.value);

    }

    // retrieve the project data
    function getProject(uint256 _projectId) public view returns(string memory, uint256, uint256, bool) {
        Project storage project = projects[_projectId];
        return (project.name, project.goalAmount, project.currentAmount, project.isActive);
    }
}