import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import hre from 'hardhat';
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Lock", function () {
  it("Should set the right unlockTime", async function () {
    const lockedAmount = 1_000_000_000;
    const ONE_YEAR_IN_SECS = 365 * 24 * 60 * 60;
    const unlockTime = (await time.latest()) + ONE_YEAR_IN_SECS;

    // deploy a lock contract where funds can be withdrawn
    // one year in the future
    const Lock = await ethers.getContractFactory("Lock");
    const lock = await Lock.deploy(unlockTime, { value: lockedAmount });

    // assert that the value is correct
    expect(await lock.unlockTime()).to.equal(unlockTime);
  });
});