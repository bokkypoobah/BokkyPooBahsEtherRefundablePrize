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
printf "CURRENTTIME                   = '$CURRENTTIME' '$CURRENTTIMES'\n"
printf "CURRENTTIMEP1M                = '$CURRENTTIMEP1M' '$CURRENTTIMEP1MS'\n"
printf "CURRENTTIMEP2M                = '$CURRENTTIMEP2M' '$CURRENTTIMEP2MS'\n"
printf "CURRENTTIMEP3M                = '$CURRENTTIMEP3M' '$CURRENTTIMEP3MS'\n"


# --- Make copy of SOL file and strip out comments ---
`cp $BERPSOL $BERPTEMPSOL`
`perl -pi -e "s/^\/\*.*$//; s/^ \*.*$//; " $BERPTEMPSOL`

# --- Modify addresses ---
`perl -pi -e "s/\(deployedAt \+ 2 days\)/$CURRENTTIMEP1M/" $BERPTEMPSOL`
`perl -pi -e "s/\(deployedAt \+ 7 days\)/$CURRENTTIMEP2M/" $BERPTEMPSOL`
`perl -pi -e "s/\(deployedAt \+ 30 days\)/$CURRENTTIMEP2M/" $BERPTEMPSOL`
`perl -pi -e "s/\(deployedAt \+ 60 days\)/$CURRENTTIMEP2M/" $BERPTEMPSOL`
`perl -pi -e "s/\(deployedAt \+ 90 days\)/$CURRENTTIMEP2M/" $BERPTEMPSOL`
`perl -pi -e "s/\(deployedAt \+ 365 days\)/$CURRENTTIMEP2M/" $BERPTEMPSOL`
`perl -pi -e "s/\(deployedAt \+ 3652 days\)/$CURRENTTIMEP3M/" $BERPTEMPSOL`

# --- Check differences ---
TEST=`diff $BERPSOL $BERPTEMPSOL`
echo "--- Differences ---"
echo "$TEST"

FLATTENEDBERPSOL=`./stripCrLf $BERPTEMPSOL | tr -s ' '`
printf "var barfSource = \'$FLATTENEDBERPSOL\';" > $INCLUDEJS

exit

geth --verbosity 3 attach $GETHATTACHPOINT << EOF | tee $TEST1OUTPUT
loadScript("functions.js");
unlockAccounts("$PASSWORD");
printBalances();

// Load source code
loadScript("$INCLUDEJS");
// console.log("barfSource=" + barfSource);

var barfCompiled = web3.eth.compile.solidity(barfSource);
console.log("----------v barfCompiled v----------");
barfCompiled;
console.log("----------^ barfCompiled ^----------");
console.log("DATA: tokenABI=" + JSON.stringify(barfCompiled["<stdin>:BokkyPooBahsAutonomousRefundathonFacility"].info.abiDefinition));

// -----------------------------------------------------------------------------
var testMessage = "Test 1.1 Deploy BARF Contract";
console.log("RESULT: " + testMessage);
var barfTx = null;
var barfContract = web3.eth.contract(barfCompiled["<stdin>:BokkyPooBahsAutonomousRefundathonFacility"].info.abiDefinition);
var barf = barfContract.new({from: ownerAccount,
  data: barfCompiled["<stdin>:BokkyPooBahsAutonomousRefundathonFacility"].code, gas: 4000000},
  function(e, contract) {
    if (!e) {
      if (!contract.address) {
        barfTx = contract.transactionHash;
        console.log("barfTx=" + barfTx);
      } else {
        barfAddress = contract.address;
        addAccount(barfAddress, "BARF");
        addContractAddressAndAbi(barfAddress, barfCompiled["<stdin>:BokkyPooBahsAutonomousRefundathonFacility"].info.abiDefinition);
        printTxData("barfAddress=" + barfAddress, barfTx);
      }
    }
  }
);
while (txpool.status.pending > 0) {
}
printBalances();
printContractStaticDetails();
printContractDynamicDetails();
failIfGasEqualsGasUsedOrContractAddressNull(barfAddress, barfTx, testMessage);
console.log("RESULT:   CHECK 1. BARF Owner pays a little gas");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 1.2 Member1 buys tokens in first period when 1 BARF = 0.01 ETH";
console.log("RESULT: " + testMessage);
var tx12 = barf.memberBuyToken(1, {from: member1, gas: 4500000, value: web3.toWei(12.54, "ether")});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx12", tx12);
failIfGasEqualsGasUsed(tx12, testMessage);
console.log("RESULT:   CHECK 1. Member1 ether balance -12.54 ETH");
console.log("RESULT:   CHECK 2. Member1 token balance +1,254 BARF");
console.log("RESULT:   CHECK 3. BARF contract ether balance +12.54 ETH");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 1.3 Member1 transfers 1254 BARF to member2";
console.log("RESULT: " + testMessage);
var tokenBalance = barf.balanceOf(member1);
var tx13 = barf.transfer(member2, tokenBalance, {from: member1, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx13", tx13);
failIfGasEqualsGasUsed(tx13, testMessage);
console.log("RESULT:   CHECK 1. Member1 token balance -1,254 BARF");
console.log("RESULT:   CHECK 2. Member2 token balance +1,254 BARF");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 1.4 Member2 sells tokens in first period when 1 BARF = 0.01 ETH";
console.log("RESULT: " + testMessage);
var tokenBalance = barf.balanceOf(member2);
var tx14 = barf.memberSellToken(tokenBalance, {from: member2, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx14", tx14);
failIfGasEqualsGasUsed(tx14, testMessage);
console.log("RESULT:   CHECK 1. Member2 token balance 0 BARF");
console.log("RESULT:   CHECK 2. BARF contract ether balance 0 ETH");
console.log("RESULT:   CHECK 2. contract.amountOfEthersOwnerCanWithdraw 0 ETH");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 2.1 Member3 buys tokens in the second period when 1 BARF = 0.02 ETH";
console.log("RESULT: " + testMessage);
var date1M = new Date($CURRENTTIMEP1M * 1000);
console.log("RESULT: Waiting until after $CURRENTTIMEP1M " + date1M + " currentDate=" + new Date());
while ((new Date()).getTime() <= date1M.getTime()) {
}
console.log("RESULT: Waited until after $CURRENTTIMEP1M " + date1M + " currentDate=" + new Date());
var tx21 = eth.sendTransaction({from: member3, to: barfAddress, gas: 400000, value: web3.toWei(100, "ether")});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx21", tx21);
failIfGasEqualsGasUsed(tx21, testMessage);
console.log("RESULT:   CHECK 1. Member3 ether balance -100 ETH");
console.log("RESULT:   CHECK 2. Member3 token balance +5,000 BARF");
console.log("RESULT:   CHECK 3. BARF contract ether balance +100 ETH");
console.log("RESULT:   CHECK 2. contract.amountOfEthersOwnerCanWithdraw 50 ETH");
console.log("RESULT: ");

// -----------------------------------------------------------------------------
testMessage = "Test 2.2 Member3 approves a transfer of 2000 BARF to member2";
console.log("RESULT: " + testMessage);
var approveAmount = web3.toWei(2000, "ether");
var tx22 = barf.approve(member2, approveAmount, {from: member3, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx22", tx22);
failIfGasEqualsGasUsed(tx22, testMessage);
console.log("RESULT:   CHECK 1. Approval event generated for 2000 BARF");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 2.3 Member2 transfer 1,000 BARF from member3";
console.log("RESULT: " + testMessage);
var transferAmount = web3.toWei(1000, "ether");
var tx23 = barf.transferFrom(member3, member2, transferAmount, {from: member2, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx23", tx23);
failIfGasEqualsGasUsed(tx23, testMessage);
// console.log("RESULT:   CHECK 1. Approval event generated for 2000 BARF");
console.log("RESULT:   CHECK 1. Member2 ether balance +1,000 ETH");
console.log("RESULT:   CHECK 2. Member3 token balance -1,000 BARF");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 2.4 Member2 transfer 10,000 BARF from member3 - unsuccessful";
console.log("RESULT: " + testMessage);
var transferAmount = web3.toWei(10000, "ether");
var tx24 = barf.transferFrom(member3, member2, transferAmount, {from: member2, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx24", tx24);
failIfGasEqualsGasUsed(tx24, testMessage);
console.log("RESULT:   CHECK 1. IMPORTANT - No changes");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 3.1 Member4 buys tokens in the last period when 1 BARF = 1,000,000 ETH";
console.log("RESULT: " + testMessage);
var date3M = new Date($CURRENTTIMEP3M * 1000);
console.log("RESULT: Waiting until after $CURRENTTIMEP3M " + date3M + " currentDate=" + new Date());
while ((new Date()).getTime() <= date3M.getTime()) {
}
console.log("RESULT: Waited until after $CURRENTTIMEP3M " + date3M + " currentDate=" + new Date());
var tx31 = eth.sendTransaction({from: member4, to: barfAddress, gas: 400000, value: web3.toWei(1000, "ether")});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx31", tx31);
failIfGasEqualsGasUsed(tx31, testMessage);
console.log("RESULT:   CHECK 1. Member4 ether balance -1,000 ETH");
console.log("RESULT:   CHECK 2. Member4 token balance +0.001 BARF");
console.log("RESULT:   CHECK 3. BARF contract ether balance +1,000 ETH");
console.log("RESULT:   CHECK 2. contract.amountOfEthersOwnerCanWithdraw 1049.99999 ETH");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 3.2 Owner withdraw 10 ETH";
console.log("RESULT: " + testMessage);
var withdrawAmount = web3.toWei(10, "ether");
var tx32 = barf.ownerWithdraw(withdrawAmount, {from: ownerAccount, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx32", tx32);
failIfGasEqualsGasUsed(tx32, testMessage);
console.log("RESULT:   CHECK 1. Owner ether balance +10 ETH");
console.log("RESULT:   CHECK 2. BARF contract ether balance -10 ETH");
console.log("RESULT:   CHECK 3. contract.amountOfEthersOwnerCanWithdraw 1039.99999 ETH");
console.log("RESULT: ");


// -----------------------------------------------------------------------------
testMessage = "Test 4.1 Member2 transfers 2,000 BARF tokens to Member1 when only 1,000 BARF owned - unsuccessful";
console.log("RESULT: " + testMessage);
var transferAmount = web3.toWei(2000, "ether");
var tx41 = barf.transfer(member1, transferAmount, {from: member2, gas: 4500000, value: 0});
while (txpool.status.pending > 0) {
}
printBalances();
printContractDynamicDetails();
printTxData("tx41", tx41);
failIfGasEqualsGasUsed(tx41, testMessage);
console.log("RESULT:   CHECK 1. IMPORTANT - No changes");
console.log("RESULT: ");

EOF
grep "RESULT: " $TEST1OUTPUT | sed "s/RESULT: //" > $TEST1RESULTS
cat $TEST1RESULTS