// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    address private immutable c1;
    address private immutable c2;
    address private immutable c3;
    address private immutable c4;
    uint256 private immutable createTime;
    uint256 private immutable amount;

    // 56949
    constructor(address[4] memory _contributors) payable {
        c1 = _contributors[0];
        c2 = _contributors[1];
        c3 = _contributors[2];
        c4 = _contributors[3];
        createTime = block.timestamp;
        amount = msg.value / 4;
    }

    function distribute() external {
        unchecked {
            require(
                block.timestamp - 1 weeks > createTime,
                'cannot distribute yet'
            );
        }

        payable(c1).send(amount);

        payable(c2).send(amount);

        payable(c3).send(amount);

        selfdestruct(payable(c4));
    }
}
