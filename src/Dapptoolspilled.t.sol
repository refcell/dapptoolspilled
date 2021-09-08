pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Dapptoolspilled.sol";

contract DapptoolspilledTest is DSTest {
    Dapptoolspilled dapptoolspilled;

    function setUp() public {
        dapptoolspilled = new Dapptoolspilled();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
