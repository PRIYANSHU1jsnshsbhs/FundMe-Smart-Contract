// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
function run() external returns (FundMe) {
    // anything before start broadcast is not recorded in the script and is run on a simulated vm
    // Therefore not a real transaction
    HelperConfig helperConfig = new HelperConfig();
    address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
    vm.startBroadcast();
    FundMe fundMe = new FundMe(0x34A1D3fff3958843C43aD80F30b94c510645C316);
    vm.stopBroadcast();
    return fundMe;
    }
}