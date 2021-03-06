# BokkyPooBah's Ether Refundable Prize

A digital gift token backed by ethers.

My initial use is to incentivise The DAO token holders to withdraw their refunds, but anyone is free to use these unlimited (but increasingly more expensive to purchase) tokens as a digital ETH gift card. 

This is my first implementation of [Vlad Zamfir's Safe Token Sale Mechanism Contract](https://medium.com/@Vlad_Zamfir/a-safe-token-sale-mechanism-8d73c430ddd1).

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

Token Explorer: [0xed7da010027967365e0a7c370c1dde2f9fe4477f](https://etherscan.io/token/0xed7da010027967365e0a7c370c1dde2f9fe4477f)

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

Details of this offer from [Incentivising The DAO Refundathon With The BERP Tokens Prize Pool. Come Claim Your Prize! Ends In Less Than 5 Days](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/) dated Apr 10 2017 follow:

> **Summary**
> 
> * The DAO To ETC refund withdrawals end on April 15 2017 (unless extended) and there is 1,687,973.8684 ETC (USD 4,405,611.80) waiting to be [withdrawn](https://gastracker.io/addr/0x9f5304da62a5408416ea58a17a92611019bd5ce3)
> * The DAO token holders (DTHs) who execute their DAO to ETC (most important), DAO to ETH, and DAO to ETH ExtraBalance withdrawals will go into a pool for BokkyPooBah's Ether Refundable Prize (BERP) token distribution
> * Individuals who causes other DTHs to execute their refund withdrawals will also go into the same pool for BERP token distribution
> * I will contribute 12,540 BERP tokens to the BERP token distribution pool
> * Each BERP token will always have a minimum value of 0.001 ETH
> * Anyone who strongly feels that the DAO to ETC withdrawal contract needs to be drawn down so the Whitehat Group (WHG) does not get to decide what to do with the funds can send a contribution to the pool
> * Anyone who wants to help incentivise DTHs withdraw can also send a contribution to the pool
> * Any contributions of ETH or BERP tokens sent to [0x000003e1e88a1110e961f135df8cdea4b1ffa81a](https://etherscan.io/token/0xed7da010027967365e0a7c370c1dde2f9fe4477f?a=0x000003e1e88a1110e961f135df8cdea4b1ffa81a) will be added to the prize distribution pool
> * BERP tokens can be bought from the BERP token contract by sending ETH to [0xed7da010027967365e0a7c370c1dde2f9fe4477f](https://etherscan.io/address/0xed7da010027967365e0a7c370c1dde2f9fe4477f)
> * BERP token details can be found at [here](https://github.com/bokkypoobah/BokkyPooBahsEtherRefundablePrize)
> 
> **What Can You Do?**
> 
> * If you are a DTH, execute your refund withdrawals immediately!
> * **If you know any DTHs, contact them through whatever means and get them to execute their refund withdrawals immediately!**
> 
> **How Do I/The DTH Withdraw My/Their Refunds?**
> 
> * See https://theethereum.wiki/w/index.php/The_DAO_Refunds
> * Contact me in this post or in a private message if you need assistance with your withdrawals
> 
> **How Do I/The DTH Get Into The Prize Distribution Pool?**
> 
> * Post your transaction id and your BERP reward account to this post
> * Or if you caused a DTH to execute their refund, post their transaction id and your BERP reward account to this post
> * If you prefer, send me a private message . Note that the final distribution when the Withdrawal contract expires will be made public.
> 
> **Details**
> 
> * The DAO to ETC refund withdrawals end on April 15 2017. The Whitehat Group will have access to the balance of the funds after this date - see https://blog.bity.com/2016/09/06/whitehat-withdrawal-contract-final-deposit-is-available/
> * A few people in the Ethereum community are not happy about this, so let us try to reduce the balance of the withdrawal contract
> * 12.54 ETH has been personally donated to me recently when helping out DTHs withdraw their refunds
> * This 12.54 ETH has been used to create 12,540 BERP tokens
> * Each BERP tokens cost 0.001 ETH to purchase for the first 7 days from the creation of the BERP token contract (02:54:00 Mon April 10 2017 UTC)
> * Each BERP tokens will cost 0.0011 ETH to purchase after 7 days and up to 30 days, and this rate will continue increasing
> * See [this](https://github.com/bokkypoobah/BokkyPooBahsEtherRefundablePrize) for the price increases
> * After 1 year, each BERP tokens will cost 1,000 ETH to purchase
> * BERP tokens can always be sold back to the BERP token contract to receive 0.001 ETH for each BERP token
> * BERP tokens are ERC20 compliant, are currently tradable at [E] https://cryptoderivatives.market/token/BERP
> * Note that after 7 days, the excess cost over 1 BERP = 0.001 ETH will end up in the BERP token contract, and the owner (me) will have access to these funds. So only buy BERP tokens after 7 days if you are feeling very generous
> * You can buy BERP tokens and give them out for any purpose. They will always be refundable for 0.001 ETH
> * The final distribution (and contributions) of BERP tokens when the DAO to ETC withdrawal contract period expires will be published at https://github.com/bokkypoobah/BokkyPooBahsEtherRefundablePrize .
> 
> (This may be a bad idea, but I least I did try)
> 
> BokkyPooBah

<br />

### BERP Reward Contributions 

ETH or BERP contributions to the reward pool [0x000003e1e88a1110e961f135df8cdea4b1ffa81a](https://etherscan.io/address/0x000003e1e88a1110e961f135df8cdea4b1ffa81a) follows:

\#  | Contribution Tx | +BERP / ETH | BERP / ETH Balance | Notes
--- | -------------- | ------------- | ------ | ----
1 | [0xbf5d0043...](https://etherscan.io/tx/0xbf5d0043e619f9e2b7d6ef247e4e173a6994231d3c3d672ece9c170187b8217d) | 12,540 BERP | 12,540 BERP | My contribution
2 | [0xb4d2f9e0...](https://etherscan.io/tx/0xb4d2f9e02af79a1d182e723361c9e8b5bc979e64c6bd7e2bf914c0ee8d499e77) | 1 ETH | 13,540 BERP | 1 ETH [converted](https://etherscan.io/tx/0xf402fcef6954a30626d738c996690dd7dd498da801b5e1ee0997d30b6fcf9409) to 1,000 BERP

Any ETH contributions will be converted into BERP before the distribution.

Thanks.


<br />

### BERP Reward Distribution 

**UPDATE Apr 15 2017 - The [WhitehatWithdraw contract has been extended to Jan 10 2018](https://www.reddit.com/r/ethereum/comments/65ex5c/whg_withdraw_contract_extended/).** The date that I close the BERP Reward Distribution pool and distribute the rewards has not been decided yet. This page will be updated when this is done. 

13,540 BERPs will be distributed to the reward accounts on the ETH chain in the list below in equal proportions when the WhitehatWithdraw contract expires (expected April 15 2017):

\#  | ETH Chain Reward Account | Withdrawal Tx | Source
--- | -------------- | ------------- | ------
1 | [0xe0A2AC4c7b46Ce32C5b4Bf153Ca50E603D36Abc8](https://etherscan.io/address/0xe0A2AC4c7b46Ce32C5b4Bf153Ca50E603D36Abc8) | [0xce4babae...](http://gastracker.io/tx/0xce4babae31c62346ffa61f65a2ceab93955844459e4ead58e3cd909647c1b20a) | [Source](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/dg2p3u2/)
2 | [0x308032027f59Eb13e8A26E923958a687e81875b1](https://etherscan.io/address/0x308032027f59Eb13e8A26E923958a687e81875b1) | [0x9ec8f7166...](http://gastracker.io/tx/0x9ec8f7166fed29e03108f0e001e9cd5628237a2c9fcef7d46aee5c6770b9a24a) | [Source](https://www.reddit.com/r/ethereum/comments/64ia5z/incentivising_the_dao_refundathon_with_the_berp/dg4lc74/)
3 | [0xfD918536A8efa6F6cEFE1fa1153995Fef5E33d3B](https://etherscan.io/address/0xfD918536A8efa6F6cEFE1fa1153995Fef5E33d3B) | [0x25b40be2...](https://etherscan.io/tx/0x25b40be28a189859be555e5f0cd23248fd18fe884f426b6fbd1a4b0ab26651ab) | Private Reddit message
4 | [0xcb671b251b156e7a8ed54c8701eb3de671f8f5d5](https://etherscan.io/address/0xcb671b251b156e7a8ed54c8701eb3de671f8f5d5) | [0x161f6519...](https://etherscan.io/tx/0x161f65191ebc3ef71380ccf8904c88b27f934a7dc6191a2e6a8cba2f41438c21) | Private Reddit message
5 | [0x7BE8dA14C273005B1186f3DeB5EA5BC1A18C1c4F](https://etherscan.io/address/0x7BE8dA14C273005B1186f3DeB5EA5BC1A18C1c4F) | [0x077fe8e7...](http://gastracker.io/tx/0x077fe8e7178c668381432d4dd01df49a96f1bcc498e7a3d2706a8047e7b2cbda) | Private Reddit message - a person
6 | [0x7BE8dA14C273005B1186f3DeB5EA5BC1A18C1c4F](https://etherscan.io/address/0x7BE8dA14C273005B1186f3DeB5EA5BC1A18C1c4F) | [0x75768a45...](http://gastracker.io/tx/0x75768a450b186d344c3ef4a1d5802b5e6553b38e8274a2f159af41b348f4e004) | Private Reddit message - and the person's friend
7 | [0x17d5bf1a76f7611e00cea9be8f1022070a4ee29a](https://etherscan.io/address/0x17d5bf1a76f7611e00cea9be8f1022070a4ee29a) | [0x49f29208...](https://gastracker.io/tx/0x49f292083531df68ba66bbb5117f52e0831400eeec2c72d268cc17467bfca2ec) | Private Reddit message
8 | [0x6c86E8f3bF9C2cc5C8214A5CA6dC92dFd7dA30fF](https://etherscan.io/address/0x6c86E8f3bF9C2cc5C8214A5CA6dC92dFd7dA30fF) | [0xe8514184...](http://gastracker.io/tx/0xe85141841bf6ddcf24a76399d9f1c7d0ac51fe89dee9afebebbb899b84ede1ac) and [0xc32e7841...](https://etherscan.io/tx/0xc32e7841ae7368ddcba47543283b5280a42e306bb94011ea2ec90ae95d2e6054)| Private Reddit message
9 | [0x5056E5ffd4a227bDABEb3C62e29E274a72a3E9E8](https://etherscan.io/address/0x5056E5ffd4a227bDABEb3C62e29E274a72a3E9E8) | [0xac08dcb9...](http://gastracker.io/tx/0xac08dcb977adb0a68a427e154fc61d206b2bf8b3cbada2a67d0bf626265a101e)| Private Reddit message
10 | [0x6c9d61a7bc4effdcad6e72df9dfc12f23b9d5f35](https://etherscan.io/address/0x6c9d61a7bc4effdcad6e72df9dfc12f23b9d5f35) | [0x47c13bc4...](http://gastracker.io/tx/0x47c13bc4519ab9156c65602f5f4b725d716f39e705f4e043378df568c2bb4d9c)| Private Reddit message
11 | [0x0909a998E48eF88764B710164A1623F640BAE6C1](https://etherscan.io/address/0x0909a998E48eF88764B710164A1623F640BAE6C1) | [0x4631dc0a...](http://gastracker.io/tx/0x4631dc0a11d8e2859e5044bf2a29867d9e3884edd89662913acb13d7dcb40d5a)| Private Reddit message
12 | [0x54730fc41d0f435967b207fc23a8830380fc3a75](https://etherscan.io/address/0x54730fc41d0f435967b207fc23a8830380fc3a75) | [0x2436431a...](http://gastracker.io/tx/0x2436431aec5e0c8dbc6fbe9477e23ac92b3dfc3e0611d4cb768ad7a56e616b11)| Private Reddit message
13 | [0x169a8f6288f5f146b0105bA572200Be77606Fee2](https://etherscan.io/address/0x169a8f6288f5f146b0105bA572200Be77606Fee2) | [0x313622a5...](https://gastracker.io/tx/0x313622a51e4433e2f0c910a5be5c8474876965147c601ce857c6f90c70effaed), [0x027c262f...](https://etherscan.io/tx/0x027c262ff5844e344488cb90f54c035572d1af0d87b3d84d29dca4be8bcb3989)| Private Reddit message
14 | [0xae0CDCC50ee55019463FB8cE234188fbd0e2B60a](https://etherscan.io/address/0xae0CDCC50ee55019463FB8cE234188fbd0e2B60a) | [0x9c7d6683...](http://gastracker.io/tx/0x9c7d668385929036050bdd89867da2fcd1a6761d18dec7f78cba8c97a64cc28d), [0xe2d3c8b8...](http://gastracker.io/tx/0xe2d3c8b861c3c1cedd147cd18cda524177def5723e41cdd057d150cd9f109b3f)| Private Reddit message
15 | [0x72fb9ccB7cd01d3DBc52988712a6bA5F397617B6](https://etherscan.io/address/0x72fb9ccB7cd01d3DBc52988712a6bA5F397617B6) | [0x9c7d6683...](http://gastracker.io/tx/0x9c7d668385929036050bdd89867da2fcd1a6761d18dec7f78cba8c97a64cc28d) | Private Reddit message
16 | [0xa111F978d7aF8b7037760669381ff12550708d5b](https://etherscan.io/address/0xa111F978d7aF8b7037760669381ff12550708d5b) | [0x51a61a3e...](https://etherscan.io/tx/0x51a61a3e9a84d7345f6b0b1e7dafb72a8a6e65a5556b77dd075e0ae45b220659) | Private Reddit message
17 | [0x274d053162e53eb5bf6498450df5bab87a2ab488](https://etherscan.io/address/0x274d053162e53eb5bf6498450df5bab87a2ab488) | [0x36a035c4...](http://gastracker.io/tx/0x36a035c401870134f9ad716c5616d1f395d83dd7b1e1759c176a4768685f7692) | Private Reddit message
18 | [0xbe0ba0b2731811e6dcd67ae230f5b17cf835e1df](https://etherscan.io/address/0xbe0ba0b2731811e6dcd67ae230f5b17cf835e1df) | [0xe0b6c6d7...](http://gastracker.io/tx/0xe0b6c6d73808bb8e094800870507aea183894c245c15e8c127dfd5d4b045362d) | Private Reddit message
19 | [0xc94f92bf72b14adc310759cc342ef344609d0c6b](https://etherscan.io/address/0xc94f92bf72b14adc310759cc342ef344609d0c6b) | [0xb8db7ba5...](http://gastracker.io/tx/0xb8db7ba5ce413e22826566791bd3c9aea261aeefce042297691b16d36c804346) | DAOHub message
20 | [0xFceC7dc6323D6343A49fbf81D025cBD76AC6456B](https://etherscan.io/address/0xFceC7dc6323D6343A49fbf81D025cBD76AC6456B) | [0xab427cf7...](http://gastracker.io/tx/0xab427cf755f285c6330bc73270af27dc973fb4f29bd3ead6e838e049faa3c4b1) | Private Reddit message
21 | [0x4fe6a5d3a1b698c90DD3cb7db489Acb299B5fF92](https://etherscan.io/address/0x4fe6a5d3a1b698c90DD3cb7db489Acb299B5fF92) | [0xab427cf7...](http://gastracker.io/tx/0x9329a3925d5e7f6dfc1e2b394c1ff70df9e85bf18a7eddc8227a190ed6fcade7) | Private Reddit message
22 | [0xcb3ABf60B137E389eB78061a358A85Bcac73D7b6](https://etherscan.io/address/0xcb3ABf60B137E389eB78061a358A85Bcac73D7b6) | [0xe4551ab1...](http://gastracker.io/tx/0xe4551ab10d10ec8c6dfc8adf87c58f92edbe04e2beca94fe232abdb410421b62) | Private DAOHub message



<br />

Enjoy. (c) BokkyPooBah / Bok Consulting Pty Ltd 2017. The MIT Licence.
