// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedRequire {
    uint256 constant COOLDOWN = 1 minutes;
    uint256 lastPurchaseTime;

    function purchaseToken() external payable {
        require(msg.value == 0.1 ether, 'cannot purchase');

        unchecked {
            require(block.timestamp - COOLDOWN > lastPurchaseTime);
        }
        lastPurchaseTime = block.timestamp;
        // mint the user a token
    }
}
