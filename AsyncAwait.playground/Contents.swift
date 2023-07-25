import Cocoa

func loadSignature(url: URL) async throws -> String? {
    let (data, _) = try await URLSession.shared.data(from: url)
    return String(data: data, encoding: .utf8)
}

actor Holder {
    var results: [String] = []
    
    func setResults(_ results: [String]) {
        self.results = results
    }
    
    func append(_ value: String) {
        results.append(value)
    }
}

let holder = Holder()

Task {
    await holder.setResults([])
//    await holder.append(Data().appending)
}
