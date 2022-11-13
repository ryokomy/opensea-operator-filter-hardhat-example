import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("ERC721OpenSeaOperatorFilter", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployERC721OpenSeaOperatorFilter() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const ERC721OpenSeaOperatorFilter = await ethers.getContractFactory(
      "ERC721OpenSeaOperatorFilter"
    );
    const erc721OpenSeaOperatorFilter =
      await ERC721OpenSeaOperatorFilter.deploy();

    return { erc721OpenSeaOperatorFilter, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Should deploy", async function () {
      const { erc721OpenSeaOperatorFilter } =
        await deployERC721OpenSeaOperatorFilter();

      expect(erc721OpenSeaOperatorFilter.address).is.not.null;
    });
  });
});
