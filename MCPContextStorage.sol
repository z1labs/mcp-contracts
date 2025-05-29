pragma solidity =0.8.24;

contract MCPContextStorage {

    constructor() {
    }

    struct UserContext {
        string[] context;
    }

    mapping(address => UserContext) private userContexts;

    function putContext(address user, string[] calldata hashes) external {
        for (uint256 i = 0; i < hashes.length; i++) {
            userContexts[user].context.push(hashes[i]);
        }
    }

}
