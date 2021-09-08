pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Dapptoolspilled.sol";

contract DapptoolspilledTest is DSTest {
    Dapptoolspilled dapptoolspilled;

    function setUp() public {
        dapptoolspilled = new Dapptoolspilled();
    }

    function testGetInitialValue() public {
        assertTrue(dapptoolspilled.get() == 0);
    }

    function testSetValue(uint256 set_val) public {
        dapptoolspilled.set(set_val);
        assertTrue(dapptoolspilled.get() == set_val);
    }
}
