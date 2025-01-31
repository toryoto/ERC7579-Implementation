// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { Script } from "forge-std/Script.sol";
import { MSAAdvanced } from "src/MSAAdvanced.sol";
import { MSAFactory } from "src/MSAFactory.sol";
import { Bootstrap } from "src/utils/Bootstrap.sol";

/**
 * @title Deploy
 * @author @kopy-kat
 */
contract DeployScript is Script {
    function run() public {
        bytes32 salt = bytes32(uint256(1));

        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);

        // Deploy account and factory
        MSAAdvanced msaAdvanced = new MSAAdvanced{ salt: salt }();
        new MSAFactory{ salt: salt }(address(msaAdvanced));

        // Deploy Bootstrap
        new Bootstrap{ salt: salt }();

        vm.stopBroadcast();
    }
}
