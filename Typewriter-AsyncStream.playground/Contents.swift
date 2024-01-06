import Cocoa

var phrase = "Hello, playground"
var index = phrase.startIndex
let stream = AsyncStream<String> {
    guard index < phrase.endIndex else { return nil }
    do {
        try await Task.sleep(nanoseconds: 1_000_000_000)
    } catch {
        return nil
    }
    
    let result = String(phrase[phrase.startIndex ... index])
    index = phrase.index(after: index)
    return result
}

for try await item in stream {
    print(item)
}


