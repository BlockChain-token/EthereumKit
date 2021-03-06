public struct Balance {
    public let wei: Wei
    
    public var ether: Ether {
        return Converter.toEther(wei: wei)
    }
}

extension Balance: Codable {
    private enum CodingKeys: String, CodingKey {
        case wei
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        wei = try container.decode(Wei.self, forKey: .wei)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(wei, forKey: .wei)
    }
}
