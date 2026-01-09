// Inside your main.nr contract scope
#[private]
fn transfer(to: AztecAddress, amount: u128) {
    // 1. Calculate the 5% Legacy Fee
    let fee = (amount * 5) / 100; 
    let transfer_amount = amount - fee;

    // 2. Send the Fee to the Syndicate/Legacy Wallet
    let syndicate_wallet = AztecAddress::from_field(0x...YOUR_WALLET_ADDRESS);
    token_utils::decrement_balance(context, msg_sender(), amount);
    token_utils::increment_balance(context, to, transfer_amount);
    token_utils::increment_balance(context, syndicate_wallet, fee); // The "Gangster" cut 🥷
}
