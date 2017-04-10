#!/bin/sh
# -----------------------------------------------------------------------------
# Testing BokkyPooBah's Ether Refundable Prize Token Contract
#
# (c) BokkyPooBah / Bok Consulting Pty Ltd 2017. The MIT licence.
# -----------------------------------------------------------------------------

GETHATTACHPOINT=`grep ^IPCFILE= settings.txt | sed "s/^.*=//"`
PASSWORD=`grep ^PASSWORD= settings.txt | sed "s/^.*=//"`
BERPSOL=`grep ^BERPSOL= settings.txt | sed "s/^.*=//"`
BERPTEMPSOL=`grep ^BERPTEMPSOL= settings.txt | sed "s/^.*=//"`
INCLUDEJS=`grep ^INCLUDEJS= settings.txt | sed "s/^.*=//"`
TEST1OUTPUT=`grep ^TEST1OUTPUT= settings.txt | sed "s/^.*=//"`
TEST1RESULTS=`grep ^TEST1RESULTS= settings.txt | sed "s/^.*=//"`

printf "GETHATTACHPOINT               = '$GETHATTACHPOINT'\n"
printf "PASSWORD                      = '$PASSWORD'\n"
printf "BERPSOL                       = '$BERPSOL'\n"
printf "BERPTEMPSOL                   = '$BERPTEMPSOL'\n"
printf "INCLUDEJS                     = '$INCLUDEJS'\n"
printf "TEST1OUTPUT                   = '$TEST1OUTPUT'\n"
printf "TEST1RESULTS                  = '$TEST1RESULTS'\n"

CURRENTTIME=`date +%s`
CURRENTTIMES=`date -r $CURRENTTIME -u`
CURRENTTIMEP1M=`echo "$CURRENTTIME+60" | bc`
CURRENTTIMEP1MS=`date -r $CURRENTTIMEP1M -u`
CURRENTTIMEP2M=`echo "$CURRENTTIME+60*2" | bc`
CURRENTTIMEP2MS=`date -r $CURRENTTIMEP2M -u`
CURRENTTIMEP3M=`echo "$CURRENTTIME+60*3" | bc`
CURRENTTIMEP3MS=`date -r $CURRENTTIMEP3M -u`
CURRENTTIMEP4M=`echo "$CURRENTTIME+60*4" | bc`
CURRENTTIMEP4MS=`date -r $CURRENTTIMEP4M -u`
CURRENTTIMEP5M=`echo "$CURRENTTIME+60*5" | bc`
CURRENTTIMEP5MS=`date -r $CURRENTTIMEP5M -u`
CURRENTTIMEP6M=`echo "$CURRENTTIME+60*6" | bc`
CURRENTTIMEP6MS=`date -r $CURRENTTIMEP6M -u`
printf "CURRENTTIME                   = '$CURRENTTIME' '$CURRENTTIMES'\n"
printf "CURRENTTIMEP1M                = '$CURRENTTIMEP1M' '$CURRENTTIMEP1MS'\n"
printf "CURRENTTIMEP2M                = '$CURRENTTIMEP2M' '$CURRENTTIMEP2MS'\n"
printf "CURRENTTIMEP3M                = '$CURRENTTIMEP3M' '$CURRENTTIMEP3MS'\n"
printf "CURRENTTIMEP4M                = '$CURRENTTIMEP4M' '$CURRENTTIMEP4MS'\n"
printf "CURRENTTIMEP5M                = '$CURRENTTIMEP5M' '$CURRENTTIMEP5MS'\n"
printf "CURRENTTIMEP6M                = '$CURRENTTIMEP6M' '$CURRENTTIMEP6MS'\n"

# --- Make copy of SOL file and strip out comments ---
`cp $BERPSOL $BERPTEMPSOL`
`perl -pi -e "s/^\/\*.*$//; s/^ \*.*$//; " $BERPTEMPSOL`

# --- Modify periods ---
`perl -pi -e "s/7 days\)/1 minutes\)/" $BERPTEMPSOL`
`perl -pi -e "s/30 days\)/2 minutes\)/" $BERPTEMPSOL`
`perl -pi -e "s/60 days\)/3 minutes\)/" $BERPTEMPSOL`
`perl -pi -e "s/90 days\)/4 minutes\)/" $BERPTEMPSOL`
`perl -pi -e "s/365 days\)/5 minutes\)/" $BERPTEMPSOL`

# --- Check differences ---
TEST=`diff $BERPSOL $BERPTEMPSOL`
echo "--- Differences ---"
echo "$TEST"

FLATTENEDBERPSOL=`./stripCrLf $BERPTEMPSOL | tr -s ' '`
printf "var berpSource = \'$FLATTENEDBERPSOL\';" > $INCLUDEJS

geth --verbosity 3 attach $GETHATTACHPOINT << EOF | tee $TEST1OUTPUT
loadScript("functions.js");
unlockAccounts("$PASSWORD");
printBalances();

// Load source code
loadScript("$INCLUDEJS");
// console.log("berpSource=" + berpSource);

var berpCompiled = web3.eth.compile.solidity(berpSource);
console.log("----------v berpCompiled v----------");
berpCompiled;
console.log("----------^ berpCompiled ^----------");
console.log("DATA: tokenABI=" + JSON.stringify(berpCompiled["<stdin>:BokkyPooBahsEtherRefundablePrize"].info.abiDefinition));

// -----------------------------------------------------------------------------
var testMessage = "Test 1.1 Deploy BERP Contract";
console.log("RESULT: " + testMessage);
var berpTx = null;
var berpContract = web3.eth.contract(berpCompiled["<stdin>:BokkyPooBahsEtherRefundablePrize"].info.abiDefinition);
var berp = berpContract.new({from: ownerAccount,
  data: berpCompiled["<stdin>:BokkyPooBahsEtherRefundablePrize"].code, gas: 4000000},
  function(e, contract) {
    if (!e) {
      if (!contract.address) {
        berpTx = contract.transactionHash;
        console.log("berpTx=" + berpTx);
      } else {
        berpAddress = contract.address;
        addAccount(berpAddress, "BERP");
        addContractAddressAndAbi(berpAddress, berpCompiled["<stdin>:BokkyPooBahsEtherRefundablePrize"].info.abiDefinition);
        printTxData("berpAddress=" + berpAddress, berpTx);
      }
    }
  }
);
while (txpool.status.pending > 0) {
}
printBalances();
printContractStaticDetails();
printContractDynamicDetails();
failIfGasEqualsGasUsedOrContractAddressNull(berpAddress, berpTx, testMessage);
console.log("RESULT:   CHECK 1. BERP Owner pays a little gas");
console.log("RESULT:   CHECK 2. buyPrice at $CURRENTTIMES is " + web3.fromWei(berp.buyPriceAt($CURRENTTIME), "ether"));
console.log("RESULT:   CHECK 3. buyPrice at $CURRENTTIMEP1MS is " + web3.fromWei(berp.buyPriceAt($CURRENTTIMEP1M), "ether"));
console.log("RESULT:   CHECK 4. buyPrice at $CURRENTTIMEP2MS is " + web3.fromWei(berp.buyPriceAt($CURRENTTIMEP2M), "ether"));
console.log("RESULT:   CHECK 5. buyPrice at $CURRENTTIMEP3MS is " + web3.fromWei(berp.buyPriceAt($CURRENTTIMEP3M), "ether"));
console.log("RESULT:   CHECK 6. buyPrice at $CURRENTTIMEP4MS is " + web3.fromWei(berp.buyPriceAt($CURRENTTIMEP4M), "ether"));
console.log("RESULT:   CHECK 7. buyPrice at $CURRENTTIMEP5MS is " + web3.fromWei(berp.buyPriceAt($CURRENTTIMEP5M), "ether"));
console.log("RESULT:   CHECK 8. buyPrice at $CURRENTTIMEP6MS is " + web3.fromWei(berp.buyPriceAt($CURRENTTIMEP6M), "ether"));
console.log("RESULT: ");

// -----------------------------------------------------------------------------
testMessage = "Test 1.2 Member1 buys tokens in first period when 1 BERP = 0.001 ETH";
console.log("RESULT: " + testMessage);
var tx12 = berp.buyTokens(1, {from: member1, gas: 4500000, value: web3.toWei(12.54, "ether")});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx12", tx12);
failIfGasEqualsGasUsed(tx12, testMessage);
console.log("RESULT:   CHECK 1. Member1 ether balance -12.54 ETH");
console.log("RESULT:   CHECK 2. Member1 token balance +12,540 BERP");
console.log("RESULT:   CHECK 3. BERP contract ether balance +12.54 ETH");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 1.3 Member1 transfers 12,540 BERP to member2";
console.log("RESULT: " + testMessage);
var tokenBalance = berp.balanceOf(member1);
var tx13 = berp.transfer(member2, tokenBalance, {from: member1, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx13", tx13);
failIfGasEqualsGasUsed(tx13, testMessage);
console.log("RESULT:   CHECK 1. Member1 token balance -12,540 BERP");
console.log("RESULT:   CHECK 2. Member2 token balance +12,540 BERP");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 1.4 Member2 sells tokens in first period when 1 BERP = 0.001 ETH";
console.log("RESULT: " + testMessage);
var tokenBalance = berp.balanceOf(member2);
var tx14 = berp.sellTokens(tokenBalance, {from: member2, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx14", tx14);
failIfGasEqualsGasUsed(tx14, testMessage);
console.log("RESULT:   CHECK 1. Member2 token balance 0 BERP");
console.log("RESULT:   CHECK 2. BERP contract ether balance 0 ETH");
console.log("RESULT:   CHECK 2. contract.amountOfEthersOwnerCanWithdraw 0 ETH");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 2.1 Member3 buys tokens in the second period when 1 BERP = 0.0011 ETH";
console.log("RESULT: " + testMessage);
var waitUntil = new Date(berp.deployedAt().plus(60) * 1000);
console.log("RESULT: Waiting until after " + waitUntil.getTime() + " " + waitUntil + " currentDate=" + new Date());
while ((new Date()).getTime() <= waitUntil.getTime()) {
}
console.log("RESULT: Waited until after " + waitUntil.getTime() + " " + waitUntil + " currentDate=" + new Date());
var tx21 = eth.sendTransaction({from: member3, to: berpAddress, gas: 400000, value: web3.toWei(100, "ether")});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx21", tx21);
failIfGasEqualsGasUsed(tx21, testMessage);
console.log("RESULT:   CHECK 1. Member3 ether balance -100 ETH");
console.log("RESULT:   CHECK 2. Member3 token balance +90,909.09 BERP");
console.log("RESULT:   CHECK 3. BERP contract ether balance +100 ETH");
console.log("RESULT:   CHECK 2. contract.amountOfEthersOwnerCanWithdraw 9.0909 ETH");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 2.2 Member3 approves a transfer of 2000 BERP to member2";
console.log("RESULT: " + testMessage);
var approveAmount = web3.toWei(2000, "ether");
var tx22 = berp.approve(member2, approveAmount, {from: member3, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx22", tx22);
failIfGasEqualsGasUsed(tx22, testMessage);
console.log("RESULT:   CHECK 1. Approval event generated for 2000 BERP");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 2.3 Member2 transfer 1,000 BERP from member3";
console.log("RESULT: " + testMessage);
var transferAmount = web3.toWei(1000, "ether");
var tx23 = berp.transferFrom(member3, member2, transferAmount, {from: member2, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx23", tx23);
failIfGasEqualsGasUsed(tx23, testMessage);
console.log("RESULT:   CHECK 1. Member2 ether balance +1,000 ETH");
console.log("RESULT:   CHECK 2. Member3 token balance -1,000 BERP");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 2.4 Member2 transfer 100,000 BERP from member3 - unsuccessful";
console.log("RESULT: " + testMessage);
var transferAmount = web3.toWei(100000, "ether");
var tx24 = berp.transferFrom(member3, member2, transferAmount, {from: member2, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx24", tx24);
failIfGasEqualsGasUsed(tx24, testMessage);
console.log("RESULT:   CHECK 1. IMPORTANT - No changes");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 3.1 Member4 buys tokens in the last period when 1 BERP = 1,000 ETH";
console.log("RESULT: " + testMessage);
waitUntil = new Date(berp.deployedAt().plus(60*5) * 1000);
console.log("RESULT: Waiting until after " + waitUntil.getTime() + " " + waitUntil + " currentDate=" + new Date());
while ((new Date()).getTime() <= waitUntil.getTime()) {
}
console.log("RESULT: Waited until after " + waitUntil.getTime() + " " + waitUntil + " currentDate=" + new Date());
var tx31 = eth.sendTransaction({from: member4, to: berpAddress, gas: 400000, value: web3.toWei(1000, "ether")});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx31", tx31);
failIfGasEqualsGasUsed(tx31, testMessage);
console.log("RESULT:   CHECK 1. Member4 ether balance -1,000 ETH");
console.log("RESULT:   CHECK 2. Member4 token balance +1.000 BERP");
console.log("RESULT:   CHECK 3. BERP contract ether balance +1,000 ETH");
console.log("RESULT:   CHECK 2. contract.amountOfEthersOwnerCanWithdraw 1009.0899 ETH");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 3.2 Owner withdraw 10 ETH";
console.log("RESULT: " + testMessage);
var withdrawAmount = web3.toWei(10, "ether");
var tx32 = berp.ownerWithdraw(withdrawAmount, {from: ownerAccount, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx32", tx32);
failIfGasEqualsGasUsed(tx32, testMessage);
console.log("RESULT:   CHECK 1. Owner ether balance +10 ETH");
console.log("RESULT:   CHECK 2. BERP contract ether balance -10 ETH");
console.log("RESULT:   CHECK 3. contract.amountOfEthersOwnerCanWithdraw 999.0899 ETH");
console.log("RESULT:   CHECK 4. Withdrawal event");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 4.1 Member2 transfers 2,000 BERP tokens to Member1 when only 1,000 BERP owned - unsuccessful";
console.log("RESULT: " + testMessage);
var transferAmount = web3.toWei(2000, "ether");
var tx41 = berp.transfer(member1, transferAmount, {from: member2, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx41", tx41);
failIfGasEqualsGasUsed(tx41, testMessage);
console.log("RESULT:   CHECK 1. IMPORTANT - No changes");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 4.2 Member5 deposits 1,000 ETH";
console.log("RESULT: " + testMessage);
var depositAmount = web3.toWei(1000, "ether");
var tx42 = berp.deposit(member1, {from: member5, gas: 4500000, value: depositAmount});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx42", tx42);
failIfGasEqualsGasUsed(tx42, testMessage);
console.log("RESULT:   CHECK 1. Member5 balance -1,000 ETH");
console.log("RESULT:   CHECK 2. BERP contract ether balance +1,000 ETH");
console.log("RESULT:   CHECK 3. contract.amountOfEthersOwnerCanWithdraw 1,999.0899 ETH");
console.log("RESULT:   CHECK 4. Deposited event");
console.log("RESULT: ");

EOF
grep "RESULT: " $TEST1OUTPUT | sed "s/RESULT: //" > $TEST1RESULTS
cat $TEST1RESULTS