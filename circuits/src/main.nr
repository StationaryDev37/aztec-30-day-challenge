// Bridge-To-Freedom: Core Legacy & Badge Logic ⚓️
// Features: 2033/2035 Time-Locks & 50-Badge Hard Cap

global MAX_BADGES: u32 = 50;
global WYATT_2033: u64 = 2014848000;
global JULIANNA_2035: u64 = 2074646400;

fn main(
    deposit_amount: u32, 
    current_timestamp: u64, 
    current_badge_count: u32,
    is_wyatt: bool
) -> pub u32 {
    // 1. Verification: Only allow the first 50 "Iron Shrimpers"
    assert(current_badge_count < MAX_BADGES);

    // 2. Legacy Calculation (5% "Generation Fee")
    let legacy_fee = (deposit_amount * 5) / 100;

    // 3. Time-Lock Enforcement
    if is_wyatt {
        assert(current_timestamp >= WYATT_2033);
    } else {
        assert(current_timestamp >= JULIANNA_2035);
    }

    legacy_fee
}
