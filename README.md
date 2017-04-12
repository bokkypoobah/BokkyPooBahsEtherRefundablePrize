# BokkyPooBah's Ether Refundable Prize

A digital gift token backed by ethers.

My initial use is to incentivise The DAO token holders to withdraw their refunds, but anyone is free to use these unlimited (but increasingly more expensive to purchase) tokens as a digital ETH gift card. 

<hr />

**Table of contents**

* [The BERP Token Contract](#the-berp-token-contract)
  * [The BERP Token Contract Buy Price And Sell Price](#the-berp-token-contract-buy-price-and-sell-price)
  * [How To Buy BERP Tokens](#how-to-buy-berp-tokens)
  * [How To Sell BERP Tokens Back To The BERP Contract](#how-to-sell-berp-tokens-back-to-the-berp-contract)
  * [Testing And Results](#testing-and-results)
* [Incentivising The DAO Refundathon With The BERP Tokens Prize Pool. Come Claim Your Prize! Ends In Less Than 5 Days](#incentivising-the-dao-refundathon-with-the-berp-tokens-prize-pool-come-claim-your-prize-ends-in-less-than-5-days)
  * [BERP Reward Contributions](#berp-reward-contributions)
  * [BERP Reward Distribution](#berp-reward-distribution)

<hr />

<br />

## The BERP Token Contract

The [BokkyPooBahsEtherRefundablePrize.sol](https://github.com/bokkypoobah/BokkyPooBahsEtherRefundablePrize/blob/d54b38150ca8c5623bc9786f298421552cf2b861/contract/BokkyPooBahsEtherRefundablePrize.sol) contract has been deployed to [0xed7da010027967365e0a7c370c1dde2f9fe4477f](https://etherscan.io/address/0xed7da010027967365e0a7c370c1dde2f9fe4477f) at 02:54:00 Mon April 10 2017 UTC (Unix timestamp 1491792840).

<br />

### The BERP Token Contract Buy Price And Sell Price

These tokens can be bought from this contract at the Buy Price.

These tokens can always be sold back to this contract at the Sell Price. Ethers backing the token balance are locked in the token contract.

The periods are relative to the contract deployment date of 02:54:00 Mon April 10 2017 UTC (Unix timestamp 1491792840).

    Period                                ETH per BERP
    ------------------------- ------------------------
    From         To               Buy Price Sell Price
    ------------ ------------ ------------- ----------
    start        +7 days             0.0010     0.0010
    +7 days      +30 days            0.0011     0.0010
    +30 days     +60 days            0.0012     0.0010
    +60 days     +90 days            0.0013     0.0010
    +90 days     +365 days           0.0015     0.0010
    +365 days    forever          1000.0000     0.0010

You may find higher or lower prices for these tokens at [https://cryptoderivatives.market/token/BERP](https://cryptoderivatives.market/token/BERP).

<br />

### How To Buy BERP Tokens

Just send ETH to the BERP contract at [0xed7da010027967365e0a7c370c1dde2f9fe4477f](https://etherscan.io/address/0xed7da010027967365e0a7c370c1dde2f9fe4477f) and BERP tokens will be deposited in your account. See the Buy Price above to calculate the number of BERP tokens you will receive. Test out will a small amount before committing larger amounts.

To view the BERP tokens in Ethereum Wallet / Mist, Parity or MyEtherWallet, add a [Watch Token](https://github.com/bokkypoobah/TokenTrader/wiki/BERP-%E2%80%90-BokkyPooBah%C2%B4s-Ether-Refundable-Prize#how-to-watch-the-token-in-ethereum-wallet--mist) at the address `0xed7da010027967365e0a7c370c1dde2f9fe4477f`.

If you want to contribute BERPs to the reward contribution pool, [Watch the BERP Token Contract](https://github.com/bokkypoobah/TokenTrader/wiki/BERP-%E2%80%90-BokkyPooBah%C2%B4s-Ether-Refundable-Prize#how-to-watch-the-token-contract-in-ethereum-wallet--mist) and [Watch the BERP Token](https://github.com/bokkypoobah/TokenTrader/wiki/BERP-%E2%80%90-BokkyPooBah%C2%B4s-Ether-Refundable-Prize#how-to-watch-the-token-in-ethereum-wallet--mist), then transfer the BERP tokens to [0x000003e1e88a1110e961f135df8cdea4b1ffa81a](https://etherscan.io/address/0x000003e1e88a1110e961f135df8cdea4b1ffa81a).

<br />

### How To Sell BERP Tokens Back To The BERP Contract

[Watch the BERP Token Contract](https://github.com/bokkypoobah/TokenTrader/wiki/BERP-%E2%80%90-BokkyPooBah%C2%B4s-Ether-Refundable-Prize#how-to-watch-the-token-contract-in-ethereum-wallet--mist) in Ethereum Wallet / Mist, Parity or MyEtherWallet.

Select the Sell Tokens option

Specify the amount of tokens you want to sell

Specify the account that owns the tokens

Execute the transaction, and your BERP tokens will be transformed back into ETH

<br />

### Testing And Results

The test cases can be found in [test/01_test1.sh](https://github.com/bokkypoobah/BokkyPooBahsEtherRefundablePrize/blob/d54b38150ca8c5623bc9786f298421552cf2b861/test/01_test1.sh) and the results from this test in [test/test1results.txt](https://github.com/bokkypoobah/BokkyPooBahsEtherRefundablePrize/blob/d54b38150ca8c5623bc9786f298421552cf2b861/test/test1results.txt).

<br />

## Incentivising The DAO Refundathon With The BERP Tokens Prize Pool. Come Claim Your Prize! Ends In Less Than 5 Days

Details of this offer can be found at [Incentivising The DAO Refundathon With The BERP Tokens Prize Pool. Come Claim Your Prize! Ends In Less Than 5 Days](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/).

<br />

### BERP Reward Contributions 

ETH or BERP contributions to the reward pool have been:

* My contribution of 12,540 BERPs in tx [0xbf5d0043...](https://etherscan.io/tx/0xbf5d0043e619f9e2b7d6ef247e4e173a6994231d3c3d672ece9c170187b8217d)
* 1 ETH from [0x3776088484e009b882b3c565cb51824a7d51aa85](https://etherscan.io/address/0x3776088484e009b882b3c565cb51824a7d51aa85), tx [0xb4d2f9e0...](https://etherscan.io/tx/0xb4d2f9e02af79a1d182e723361c9e8b5bc979e64c6bd7e2bf914c0ee8d499e77)

The ETH contributions will be converted into BERP before the distribution.

Thanks.


<br />

### BERP Reward Distribution 

BERP rewards will be distributed to the list below in equal proportions when the WhitehatWithdraw contract expires (expected April 15 2017):

* Reward Account [0xe0A2AC4c7b46Ce32C5b4Bf153Ca50E603D36Abc8](https://etherscan.io/address/0xe0A2AC4c7b46Ce32C5b4Bf153Ca50E603D36Abc8). Withdrawal tx [0xce4babae...](http://gastracker.io/tx/0xce4babae31c62346ffa61f65a2ceab93955844459e4ead58e3cd909647c1b20a). [Source](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/dg2p3u2/).
* Reward account [0x308032027f59Eb13e8A26E923958a687e81875b1](https://etherscan.io/address/0x308032027f59Eb13e8A26E923958a687e81875b1). Withdrawal tx [0x9ec8f7166...](http://gastracker.io/tx/0x9ec8f7166fed29e03108f0e001e9cd5628237a2c9fcef7d46aee5c6770b9a24a). [Source](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/dg4lc74/).
* Reward account [0xfD918536A8efa6F6cEFE1fa1153995Fef5E33d3B](https://etherscan.io/address/0xfD918536A8efa6F6cEFE1fa1153995Fef5E33d3B). Withdrawal tx [0x25b40be2...](https://etherscan.io/tx/0x25b40be28a189859be555e5f0cd23248fd18fe884f426b6fbd1a4b0ab26651ab). Source - private Reddit message.
* Reward account {to be provided}. Withdrawal tx [161f6519...](https://etherscan.io/tx/0x161f65191ebc3ef71380ccf8904c88b27f934a7dc6191a2e6a8cba2f41438c21). Source - private Reddit message.

\#  | Reward Account | Withdrawal Tx | Source
-- | -------------- | ------------- | ------

1 | [0xe0A2AC4c7b46Ce32C5b4Bf153Ca50E603D36Abc8](https://etherscan.io/address/0xe0A2AC4c7b46Ce32C5b4Bf153Ca50E603D36Abc8) | [0xce4babae...](http://gastracker.io/tx/0xce4babae31c62346ffa61f65a2ceab93955844459e4ead58e3cd909647c1b20a) | [Source](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/dg2p3u2/)
2 | [0x308032027f59Eb13e8A26E923958a687e81875b1](https://etherscan.io/address/0x308032027f59Eb13e8A26E923958a687e81875b1) | [0x9ec8f7166...](http://gastracker.io/tx/0x9ec8f7166fed29e03108f0e001e9cd5628237a2c9fcef7d46aee5c6770b9a24a) | [Source](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/dg4lc74/)
3 | [0xfD918536A8efa6F6cEFE1fa1153995Fef5E33d3B](https://etherscan.io/address/0xfD918536A8efa6F6cEFE1fa1153995Fef5E33d3B) | [0x25b40be2...](https://etherscan.io/tx/0x25b40be28a189859be555e5f0cd23248fd18fe884f426b6fbd1a4b0ab26651ab) | Private Reddit message
4 | {to be provided} | [161f6519...](https://etherscan.io/tx/0x161f65191ebc3ef71380ccf8904c88b27f934a7dc6191a2e6a8cba2f41438c21) | Private Reddit message 

<br />

Enjoy. (c) BokkyPooBah / Bok Consulting Pty Ltd 2017. The MIT Licence.
