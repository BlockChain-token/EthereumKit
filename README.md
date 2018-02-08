# EthereumKit

EthereumKit is a Swift framework that enables you to create Ethereum wallet and use it in your app. 
Architectures are highly inspired by [WalletKit](https://github.com/yuzushioh/WalletKit) and [BitcoinKit](https://github.com/kishikawakatsumi/BitcoinKit)

🚨 __EthereumKit is currently under development. not ready for the production use__ 🚨

## Features
- Mnemonic recovery phrease in [BIP39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki)
- [BIP32](https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki)/[BIP44](https://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki) HD wallet

## How to Use

- Generate seed and convert it to mnemonic sentence.

```swift
let entropy = "000102030405060708090a0b0c0d0e0f"
let mnemonic = Mnemonic.create(entropy: entropy)
print(mnemonic)
// abandon amount liar amount expire adjust cage candy arch gather drum buyer
        
let seed = Mnemonic.createSeed(mnemonic: mnemonic)
print(seed)
```

- Create your wallet.

```swift
// It generates master key pair from the seed provided.
let wallet = Wallet(seed: seed, network: .main)
```

- Derive private keys at any index from its master private key.

```swift
// BIP44 key derivation
// m/44'
let purpose = wallet.privateKey.derived(at: 44, hardens: true)

// m/44'/60'
let coinType = purpose.derived(at: 60, hardens: true)

// m/44'/60'/0'
let account = coinType.derived(at: 0, hardens: true)

// m/44'/60'/0'/0
let change = account.derived(at: 0)

// m/44'/60'/0'/0
let firstPrivateKey = change.derived(at: 0)
print(firstPrivateKey.publicKey.address)
```

## License
EthereumKit is released under the [MIT License](LICENSE.md).