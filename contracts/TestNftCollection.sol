// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TestNftCollection is ERC721 {
    constructor() ERC721("MyToken", "MTK") {}
}
