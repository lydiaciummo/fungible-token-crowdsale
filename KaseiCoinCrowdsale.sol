pragma solidity ^0.5.5;

// Import the KaseiCoin contract as well as the Crowdsale and MintedCrowdsale contracts from OpenZeppelin

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// The KaseiCoinCrowdsale contract inherits functionality from Crowdsale and MintedCrowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale {
    // The constructor provides the parameters for the features of the crowdsale.
    constructor(
        uint rate,
        address payable wallet,
        KaseiCoin token
    )
    // Call the crowdsale constructor with the above parameters
    Crowdsale(rate, wallet, token) 
    public
    {
        // constructor can stay empty
    }
}


contract KaseiCoinCrowdsaleDeployer {
    // Public addresses for the token and token crowdsale contracts
    address public kaseiTokenAddress;
    address public kaseiCrowdsaleAddress;

    // Deployer constructor
    constructor(
       string memory name,
       string memory symbol,
       address payable wallet
    )
    public
    {
        // Create a new instance of the KaseiCoin contract and assign its address to a variable
        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        kaseiTokenAddress = address(token);

        // Create a new instance of the `KaseiCoinCrowdsale` contract and assign its address to a variable
        KaseiCoinCrowdsale kaseiCrowdsale = new KaseiCoinCrowdsale(1, wallet, token);
        kaseiCrowdsaleAddress = address(kaseiCrowdsale);

        // Set the `KaseiCoinCrowdsale` contract as a minter
        token.addMinter(kaseiCrowdsaleAddress);
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
        token.renounceMinter();
    }
}