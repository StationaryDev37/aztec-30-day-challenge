// A simple circuit to verify you know a 'secret' to unlock a shielded note
fn main(secret: Field, note_commitment: pub Field) {
    // We hash the secret to see if it matches the commitment stored on-chain
    let hash = std::hash::pedersen_hash([secret]);
    assert(hash == note_commitment);
}
