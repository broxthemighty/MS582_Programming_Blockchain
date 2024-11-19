// SPDX-License-Identifier: MIT

/**Created by Matt Lindborg
 * UAT MS582 Week 3
 * @title Marketplace
 * @dev Sell available products
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

pragma solidity >=0.8.2 <0.9.0;

contract Marketplace {

    struct Product {
        uint256 productId;
        string name;
        uint256 price;
        address seller;
        bool isSold;
    }

    mapping(uint256 => Product) private products;

    uint256 private productCounter;

    event productAdded(uint256 productId, string name, uint256 price, address seller);

    event productPurchased(uint256 productId, address buyer);

    function addProduct(string memory _name, uint256 _price) public {

        //check if arguments contain data, requires
        require(bytes(_name).length > 0, "No name data.");
        require(_price > 0, "Price must be greater than 0.");

        //increment productCounter to maintain an individual ID
        productCounter++;

        //Create and store new product in the mapping
        products[productCounter] = Product({
            productId: productCounter,
            name: _name,
            price: _price,
            seller: msg.sender,
            isSold: false
            });
    }

    function buyProduct(uint256 _productId) public payable { //payable lets the function accept ether

        //need to get the product by the ID
        Product storage product = products[_productId];

        //need to check if the product exists and is available for sale
        require(product.productId != 0, "Product does not exist");
        require(!product.isSold, "Product has been sold.");
        require(msg.value == product.price, "Incorrect payment.");
        require(msg.sender != product.seller, "Seller cannot buy their own product.");

        //mark the product as sold
        product.isSold = true;

        //pay the seller
        payable(product.seller).transfer(msg.value);

    }

    function getProduct(uint256 _productId) public view returns (string memory, uint256, address, bool) {

        //need to get the product by the ID
        Product storage product = products[_productId];

        //check if the product exists
        require(product.productId != 0, "Product does not exist");

        //return the product data
        return(product.name, product.price, product.seller, product.isSold);

    }
}