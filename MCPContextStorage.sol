pragma solidity =0.8.24;

import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract MCPContextStorage is ReentrancyGuard {

    constructor() {
    }

    struct UserContext {
        string[] context;
    }

    mapping(address => UserContext) private userContexts;

    function putContext(address user, string[] calldata hashes) nonReentrant external {
        for (uint256 i = 0; i < hashes.length; i++) {
            userContexts[user].context.push(hashes[i]);
        }
    }

    function getContext(address user, uint256 start, uint256 end) external view returns (string[] memory) {
        require(end > start, "Bad range");
        uint256 contextLength = userContexts[user].context.length;
        if (start >= contextLength) {
            return new string[](0);
        }
        if (end > contextLength) {
            end = contextLength;
        }
        uint256 resultLength = end - start;
        string[] memory result = new string[](resultLength);
        for (uint256 i = 0; i < resultLength; i++) {
            result[i] = userContexts[user].context[start + i];
        }
        return result;
    }

}
