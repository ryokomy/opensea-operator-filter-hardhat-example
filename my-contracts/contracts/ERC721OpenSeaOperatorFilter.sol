// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import { ERC721 } from "../lib/operator-filter-registry/lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import { DefaultOperatorFilterer } from "../lib/operator-filter-registry/src/DefaultOperatorFilterer.sol";
import { Ownable } from "../lib/operator-filter-registry/lib/openzeppelin-contracts/contracts/access/Ownable.sol";

/**
 * @title  ERC721OpenSeaOperatorFilter
 * @notice This example contract is configured to use the DefaultOperatorFilterer, which automatically registers the
 *         token and subscribes it to OpenSea's curated filters.
 *         Adding the onlyAllowedOperator modifier to the transferFrom and both safeTransferFrom methods ensures that
 *         the msg.sender (operator) is allowed by the OperatorFilterRegistry.
 */
contract ERC721OpenSeaOperatorFilter is ERC721("KomyExample", "KE"), DefaultOperatorFilterer, Ownable {
    function transferFrom(address from, address to, uint256 tokenId) public override onlyAllowedOperator(from) {
        super.transferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public override onlyAllowedOperator(from) {
        super.safeTransferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data)
        public
        override
        onlyAllowedOperator(from)
    {
        super.safeTransferFrom(from, to, tokenId, data);
    }

    function tokenURI(uint256) public pure override returns (string memory) {
        return "";
    }
}
