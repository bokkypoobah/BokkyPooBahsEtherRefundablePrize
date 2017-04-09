var accounts = [];
var accountNames = {};

addAccount(eth.accounts[0], "Account #0 - Miner");
addAccount(eth.accounts[1], "Account #1 - BARF Owner");
addAccount(eth.accounts[2], "Account #2 - Member #1");
addAccount(eth.accounts[3], "Account #3 - Member #2");
addAccount(eth.accounts[4], "Account #4 - Member #3");
addAccount(eth.accounts[5], "Account #5 - Member #4");
addAccount(eth.accounts[6], "Account #6 - Member #5");

var ownerAccount = eth.accounts[1];
var member1 = eth.accounts[2];
var member2 = eth.accounts[3];
var member3 = eth.accounts[4];
var member4 = eth.accounts[5];
var member5 = eth.accounts[6];
var barfAddress = null;

function unlockAccounts(password) {
  for (var i = 0; i < 7; i++) {
    personal.unlockAccount(eth.accounts[i], password, 100000);
  }
}

function addAccount(account, accountName) {
  accounts.push(account);
  accountNames[account] = accountName;
}

var contractAddress = null;
var contractAbi = null;

function addContractAddressAndAbi(address, abi) {
  contractAddress = address;
  contractAbi = abi;
}

function printBalances() {
  var contract = null;

  if (contractAddress != null) {
    contract = eth.contract(contractAbi).at(contractAddress);
  }

  var i = 0;
  console.log("RESULT: # Account                                                   EtherBalance                TokenBalance Name");
  accounts.forEach(function(e) {
    i++;
    var tokenBalance = 0;
    if (contract != null) {
      tokenBalance = web3.fromWei(contract.balanceOf(e), "ether");
    }
    var etherBalance = web3.fromWei(eth.getBalance(e), "ether");
    console.log("RESULT: " + i + " " + e  + " " + pad(etherBalance) + " " + pad(tokenBalance) + " " + accountNames[e]);
  });
}

function pad(s) {
  var o = s.toFixed(18);
  while (o.length < 27) {
    o = " " + o;
  }
  return o;
}

function printTxData(name, txId) {
  var tx = eth.getTransaction(txId);
  var txReceipt = eth.getTransactionReceipt(txId);
  console.log("RESULT: " + name + " gas=" + tx.gas + " gasUsed=" + txReceipt.gasUsed + " cost=" + tx.gasPrice.mul(txReceipt.gasUsed).div(1e18) +
    " block=" + txReceipt.blockNumber + " txId=" + txId);
}

function assertEtherBalance(account, expectedBalance) {
  var etherBalance = web3.fromWei(eth.getBalance(account), "ether");
  if (etherBalance == expectedBalance) {
    console.log("RESULT: OK " + account + " has expected balance " + expectedBalance);
  } else {
    console.log("RESULT: FAILURE " + account + " has balance " + etherBalance + " <> expected " + expectedBalance);
  }
}

function gasEqualsGasUsed(tx) {
  var gas = eth.getTransaction(tx).gas;
  var gasUsed = eth.getTransactionReceipt(tx).gasUsed;
  return (gas == gasUsed);
}

function failIfGasEqualsGasUsed(tx, msg) {
  var gas = eth.getTransaction(tx).gas;
  var gasUsed = eth.getTransactionReceipt(tx).gasUsed;
  if (gas == gasUsed) {
    console.log("RESULT: FAIL " + msg);
    return 0;
  } else {
    console.log("RESULT: PASS " + msg);
    return 1;
  }
}

function passIfGasEqualsGasUsed(tx, msg) {
  var gas = eth.getTransaction(tx).gas;
  var gasUsed = eth.getTransactionReceipt(tx).gasUsed;
  if (gas == gasUsed) {
    console.log("RESULT: PASS " + msg);
    return 1;
  } else {
    console.log("RESULT: FAIL " + msg);
    return 0;
  }
}

function failIfGasEqualsGasUsedOrContractAddressNull(contractAddress, tx, msg) {
  if (contractAddress == null) {
    console.log("RESULT: FAIL " + msg);
    return 0;
  } else {
    var gas = eth.getTransaction(tx).gas;
    var gasUsed = eth.getTransactionReceipt(tx).gasUsed;
    if (gas == gasUsed) {
      console.log("RESULT: FAIL " + msg);
      return 0;
    } else {
      console.log("RESULT: PASS " + msg);
      return 1;
    }
  }
}

function printContractStaticDetails() {
  var contract = eth.contract(contractAbi).at(contractAddress);
  var deployedAt = contract.deployedAt();
  console.log("RESULT: contract.deployedAt=" + deployedAt + " " + new Date(deployedAt * 1000));
  var symbol = contract.symbol();
  console.log("RESULT: contract.symbol=" + symbol);
  var name = contract.name();
  console.log("RESULT: contract.name=" + name);
  var decimals = contract.decimals();
  console.log("RESULT: contract.decimals=" + decimals);
}

function printContractDynamicDetails() {
  var i;
  var contract = eth.contract(contractAbi).at(contractAddress);

  var buyPrice = contract.buyPrice();
  console.log("RESULT: contract.buyPrice=" + web3.fromWei(buyPrice, "ether") + " ETH per BARF");
  var sellPrice = contract.sellPrice();
  console.log("RESULT: contract.sellPrice=" + web3.fromWei(sellPrice, "ether") + " ETH per BARF");
  var totalSupply = contract.totalSupply();
  console.log("RESULT: contract.totalSupply=" + web3.fromWei(totalSupply, "ether"));
  var currentEtherBalance = contract.currentEtherBalance();
  console.log("RESULT: contract.currentEtherBalance=" + web3.fromWei(currentEtherBalance, "ether"));
  var currentTokenBalance = contract.currentTokenBalance();
  console.log("RESULT: contract.currentTokenBalance=" + web3.fromWei(currentTokenBalance, "ether"));
  var amountOfEthersOwnerCanWithdraw = contract.amountOfEthersOwnerCanWithdraw();
  console.log("RESULT: contract.amountOfEthersOwnerCanWithdraw=" + web3.fromWei(amountOfEthersOwnerCanWithdraw, "ether"));

  var transferEvent = contract.Transfer({}, { fromBlock: 0, toBlock: "latest" });
  i = 0;
  transferEvent.watch(function (error, result) {
    console.log("RESULT: Transfer Event " + i++ + ": from " + result.args._from + " to " + result.args._to +
      " " + web3.fromWei(result.args._value, "ether") + " block " + result.blockNumber);
  });
  transferEvent.stopWatching();

  var approvalEvent = contract.Approval({}, { fromBlock: 0, toBlock: "latest" });
  i = 0;
  approvalEvent.watch(function (error, result) {
    console.log("RESULT: Approval Event " + i++ + ": owner " + result.args._owner + " spender " + result.args._spender +
      " " + web3.fromWei(result.args._value, "ether") + " block " + result.blockNumber);
  });
  approvalEvent.stopWatching();

  var withdrawnEvent = contract.Withdrawn({}, { fromBlock: 0, toBlock: "latest" });
  i = 0;
  withdrawnEvent.watch(function (error, result) {
    console.log("RESULT: Withdrawn Event " + i++ + ": amount " + web3.fromWei(result.args.amount, "ether") +
      " remainingWithdrawal " + web3.fromWei(result.args.remainingWithdrawal, "ether") + " block " + result.blockNumber);
  });
  withdrawnEvent.stopWatching();

  var memberBoughtTokenEvent = contract.MemberBoughtToken({}, { fromBlock: 0, toBlock: "latest" });
  i = 0;
  memberBoughtTokenEvent.watch(function (error, result) {
    console.log("RESULT: MemberBoughtToken Event " + i++ + ": buyer " + result.args.buyer + " ethers " + web3.fromWei(result.args.ethers, "ether") +
      " newEtherBalance " + web3.fromWei(result.args.newEtherBalance, "ether") + " tokens " + web3.fromWei(result.args.tokens, "ether") +
      " newTotalSupply " + web3.fromWei(result.args.newTotalSupply, "ether") + " buyPrice " + web3.fromWei(result.args.buyPrice, "ether") +
      " block " + result.blockNumber);
  });
  memberBoughtTokenEvent.stopWatching();

  var memberSoldTokenEvent = contract.MemberSoldToken({}, { fromBlock: 0, toBlock: "latest" });
  i = 0;
  memberSoldTokenEvent.watch(function (error, result) {
    console.log("RESULT: MemberSoldToken Event " + i++ + ": seller " + result.args.seller + " ethers " + web3.fromWei(result.args.ethers, "ether") +
      " newEtherBalance " + web3.fromWei(result.args.newEtherBalance, "ether") + " tokens " + web3.fromWei(result.args.tokens, "ether") +
      " newTotalSupply " + web3.fromWei(result.args.newTotalSupply, "ether") + " sellPrice " + web3.fromWei(result.args.sellPrice, "ether") +
      " block " + result.blockNumber);
  });
  memberSoldTokenEvent.stopWatching();
}
