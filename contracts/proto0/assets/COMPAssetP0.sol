// SPDX-License-Identifier: BlueOak-1.0.0
pragma solidity 0.8.9;

import "../interfaces/IMain.sol";
import "./AssetP0.sol";
import "contracts/libraries/Fixed.sol";

// Immutable data contract, extended to implement cToken and aToken wrappers.
contract COMPAssetP0 is AssetP0 {
    constructor(address erc20_) AssetP0(erc20_) {}

    // Fiatcoins return 1e18. All redemption rates should have 18 zeroes.
    function redemptionRate() public view override returns (uint256) {
        assert(false);
        return 0;
    }

    function priceUSD(IMain main) public view virtual override returns (Fix) {
        return (redemptionRate() * main.consultCompoundOracle(address(erc20())));
    }

    function fiatcoinPriceUSD(IMain) public view virtual override returns (uint256) {
        assert(false);
        return 0;
    }

    function isFiatcoin() external pure override returns (bool) {
        return false;
    }
}
