pragma solidity ^0.5.5;

//  Import ERC20, ERC20Detailed, and ERC20Mintable from the OpenZeppelin library
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

/* KaseiCoin Contract
This contract creates the KaseiCoin token
*/

contract KaseiCoin is ERC20, ERC20Detailed, ERC20Mintable {
    constructor(
        string memory name,
        string  memory symbol,
        uint initial_supply
    )
    ERC20Detailed(name, symbol, 18)
    public
    {
        //constructor stays empty. mint functionality is controlled by the crowdsale contract
    }
}