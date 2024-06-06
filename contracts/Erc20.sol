// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BlockTunixCoin is ERC20 {
    constructor() ERC20("BlockTunixCoin", "BTC") {}

    function mint(address to, uint256 amount) external {
        require(amount > 0, "Amount > 0");
        require(to != address(0), "Addresss != address(0).");
        _mint(to, amount);
    }
     function transferEther(
        address from,
        address to,
        uint256 value
    ) external {
        _transfer(from, to, value);
    }
}