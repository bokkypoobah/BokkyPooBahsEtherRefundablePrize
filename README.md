# BokkyPooBah's Ether Refundable Prize

A gift token backed by ethers.

My initial use is to incentivise The DAO token holders to withdraw their refunds, but anyone is free to use these unlimited (but increasingly costlier to purchase) tokens as a digital ETH gift card. 

The [BokkyPooBahsEtherRefundablePrize.sol](https://github.com/bokkypoobah/BokkyPooBahsEtherRefundablePrize/blob/d54b38150ca8c5623bc9786f298421552cf2b861/contract/BokkyPooBahsEtherRefundablePrize.sol) contract has been deployed to [0xed7da010027967365e0a7c370c1dde2f9fe4477f](https://etherscan.io/address/0xed7da010027967365e0a7c370c1dde2f9fe4477f) at 02:54:00 Mon April 10 2017  UTC (Unix timestamp 1491792840).

These tokens can be bought from this contract at the Buy Price.

These tokens can be sold back to this contract at the Sell Price. Ethers backing the outstanding tokens are locked in the token contract.

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

### BERP Reward Contributions 

(contributions to the BERP Reward Pool will be listed here)


<br />

### BERP Reward Distribution 

BERP rewards will be distributed to the list below in equal proportions when the WhitehatWithdraw contract expires (expected April 15 2017):

* Reward Account [0xe0A2AC4c7b46Ce32C5b4Bf153Ca50E603D36Abc8](https://etherscan.io/address/0xe0A2AC4c7b46Ce32C5b4Bf153Ca50E603D36Abc8). Transaction [0xce4babae](http://gastracker.io/tx/0xce4babae31c62346ffa61f65a2ceab93955844459e4ead58e3cd909647c1b20a). [Source](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/dg2p3u2/).

<br />

Enjoy. (c) BokkyPooBah / Bok Consulting Pty Ltd 2017. The MIT Licence.