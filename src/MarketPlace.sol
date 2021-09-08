// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.6;

contract MarketPlace {
    struct Item {
        string description;
        address seller;
        address buyer;
        uint256 price;
        bool sold;
    }

    mapping(uint256 => Item) public items;
    uint256 public itemCount;

    function addItem(string memory _description, uint256 _price)
        public
        returns (uint256)
    {
        itemCount++;
        items[itemCount].description = _description;
        items[itemCount].seller = msg.sender;
        items[itemCount].price = _price;
        return itemCount;
    }

    function getItem(uint256 _index)
        public
        view
        returns (string memory, uint256)
    {
        Item storage i = items[_index];
        require(i.seller != address(0), "item doesn't exist");
        return (i.description, i.price);
    }

    function checkItemExisting(uint256 _index) public view returns (bool) {
        Item storage i = items[_index];
        return i.seller != address(0);
    }

    function checkItemSold(uint256 _index) public view returns (bool) {
        Item storage i = items[_index];
        require(i.seller != address(0), "item doesn't exist");
        return i.sold;
    }

    function removeItem(uint256 _index) public {
        Item storage i = items[_index];
        require(i.seller != address(0), "item doesn't exist");
        require(i.seller == msg.sender, "only the seller can remove this item");
        require(!i.sold, "item is already sold");
        delete items[_index];
    }

    function buyItem(uint256 _index) public {
        Item storage i = items[_index];
        require(i.seller != address(0), "item doesn't exist");
        require(!i.sold, "item is already sold");
        i.buyer = msg.sender;
        i.sold = true;
    }
}
