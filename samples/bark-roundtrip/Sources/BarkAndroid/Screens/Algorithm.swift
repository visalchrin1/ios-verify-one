struct AESCryptoModel {
    let key: String
    let mode: Any?
    let padding: Any?
    let aes: Any?

    // from AESCryptoModel.encrypt
    func encrypt(text: String) -> String {
        TODO("Port from Swift: encrypt")
    }

    // from AESCryptoModel.decrypt
    func decrypt(ciphertext: String) -> String {
        return String(Data(aes.decrypt(Array(base64: ciphertext))), Charsets.UTF_8) ?? ""
    }
}

