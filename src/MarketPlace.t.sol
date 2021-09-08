// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./MarketPlace.sol";

contract MarketPlaceTest is DSTest {
    MarketPlace marketplace;

    function setUp() public {
        marketplace = new MarketPlace();
    }

    function testAddAnItem() public {
        string memory desc_pen = "a pen";
        uint256 price_pen = 300;
        marketplace.addItem(desc_pen, price_pen);

        string memory desc_book = "a book";
        uint256 price_book = 200;
        marketplace.addItem(desc_book, price_book);

        assertTrue(marketplace.itemCount() == 2);
    }

    function testGetItem() public {
        string memory desc_pen = "a pen";
        uint256 price_pen = 300;
        marketplace.addItem(desc_pen, price_pen);

        string memory desc;
        uint256 price;

        (desc, price) = marketplace.getItem(1);
        assertTrue(price == 300);
    }

    function testRemoveItem() public {
        string memory desc_pen = "a pen";
        uint256 price_pen = 300;
        marketplace.addItem(desc_pen, price_pen);

        string memory desc_book = "a book";
        uint256 price_book = 200;
        marketplace.addItem(desc_book, price_book);

        assertTrue(marketplace.checkItemExisting(1));

        marketplace.removeItem(1); // remove item 1

        assertTrue(!marketplace.checkItemExisting(1));
    }

    function testBuyItem() public {
        string memory desc_pen = "a pen";
        uint256 price_pen = 300;
        marketplace.addItem(desc_pen, price_pen);
        assertTrue(!marketplace.checkItemSold(1));

        marketplace.buyItem(1);
        assertTrue(marketplace.checkItemSold(1));
    }
}
