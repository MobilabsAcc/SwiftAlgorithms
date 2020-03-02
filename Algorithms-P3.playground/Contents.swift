import XCTest

class P3 {

    /**
     * Given an array of strings, return another array containing all of its longest strings.
     * For inputArray = ["aba", "aa", "ad", "vcd", "aba"], the output should be
     * allLongestStrings(inputArray) = ["aba", "vcd", "aba"].
     */
    class func allLongestStrings(_ inputArray: [String]) -> [String] {
        //fatalError("not implemented")
        var longest = 0
        for i in 0...inputArray.count - 1 {
            if inputArray[i].count > longest {
                longest = inputArray[i].count
            }
        }
        var longestChars = [String]()
        for i in 0...inputArray.count - 1 {
            if inputArray[i].count == longest {
                longestChars.append(inputArray[i])
            }
        }
        return longestChars
    }

    /**
     * Given two strings, find the number of common characters between them.
     * For s1 = "aabcc" and s2 = "adcaa", the output should be commonCharacterCount(s1, s2) = 3.
     * Strings have 3 common characters - 2 "a"s and 1 "c".
     */
    class func commonCharacterCount(_ s1: String, _ s2: String) -> Int {
        var baseS1 = [Character:Int]()
        var baseS2 = [Character:Int]()
        let charS1 = [Character](s1)
        let charS2 = [Character](s2)
        //return commonCharacterCount(s1, s2)  XDDDDDD
        for i in charS1{
            if baseS1.keys.contains(i) {
                baseS1[i]! += 1
            } else {
                baseS1[i] = 1
            }
        }
        for i in charS2 {
            if baseS2.keys.contains(i) {
                baseS2[i]! += 1
            } else {
                baseS2[i] = 1
            }
        }
        var ctr = 0
        for i in baseS1.keys {
            for j in baseS2.keys {
                if i == j {
                    ctr += ( (baseS1[i]! > baseS2[j]!) ? baseS2[j] : baseS1[i] )!
                    baseS1[i] = nil
                    baseS1[j] = nil
                }
            }
        }
        
        //fatalError("not implemented")
        return ctr
    }

    /**
     * Ticket numbers usually consist of an even number of digits. A ticket number is considered lucky
     * if the sum of the first half of the digits is equal to the sum of the second half.
     * Given a ticket number n, determine if it's lucky or not.
     * For n = 1230, the output should be isLucky(n) = true;
     * For n = 239017, the output should be isLucky(n) = false.
     */
    class func isLucky(_ n: Int) -> Bool {
        var left = 0
        var right = 0
        var tempN = n
        var len = 0
        while (tempN != 0) {
            tempN /= 10
            len += 1
        }
        
        tempN = n
        var i = 0
        while (tempN != 0) {
            if i < len/2 {
                left += tempN%10
            } else {
                right += tempN%10
            }
            i += 1
            tempN /= 10
        }
        return left == right
        
        //fatalError("not implemented")
    }

    /**
     * Some people are standing in a row in a park. There are trees between them which cannot be moved.
     * Your task is to rearrange the people by their heights in a non-descending order
     * without moving the trees. People can be very tall!
     * For a = [-1, 150, 190, 170, -1, -1, 160, 180],
     * the output should be sortByHeight(a) = [-1, 150, 160, 170, -1, -1, 180, 190].
     */
    class func sortByHeight(_ a: [Int]) -> [Int] {
        var arr = [Int]()
        var res = [Int]()
        var ctr = 0
        for i in 0...a.count-1{
            if a[i] != -1 {
                arr.append(a[i])
            }
        }
        
        arr.sort()
       
        for i in 0...a.count - 1{
            if a[i] == -1 {
                res.append(-1)
            } else {
                res.append(arr[ctr])
                ctr += 1
            }
        }
        return res
    }

    /**
     * Write a funcction that reverses characters in (possibly nested) parentheses in the input string.
     * Input strings will always be well-formed with matching ()s.
     * For inputString = "(bar)", the output should be reverseInParentheses(inputString) = "rab";
     * For inputString = "foo(bar)baz", the output should be
     * reverseInParentheses(inputString) = "foorabbaz";
     * For inputString = "foo(bar)baz(blim)", the output should be
     * reverseInParentheses(inputString) = "foorabbazmilb";
     * For inputString = "foo(bar(baz))blim", the output should be
     * reverseInParentheses(inputString) = "foobazrabblim".
     * Because "foo(bar(baz))blim" becomes "foo(barzab)blim" and then "foobazrabblim".
     */
    class func reverseInParentheses(_ inputString: String) -> String {
        var charInput = [Character](inputString)
        if charInput.count == 0 {
            return String(charInput)
        }
        if charInput[0] == "(" && charInput[1] == ")" {
            return ""
        }
        
        var openIndex = [Int]()
        var closeIndex = [Int]()
        for i in 0...inputString.count - 1{
            if charInput[i] == "(" {
                openIndex.insert(i, at: 0)
            }
            if charInput[i] == ")" {
                closeIndex.append(i)
            }
        }
        for i in 0...openIndex.count - 1{
            var lowest = closeIndex[i] - openIndex[i]
            for j in 0...closeIndex.count - 1{
                if closeIndex[i] - openIndex[j] < lowest {
                    var cond = true
                    for k in (openIndex[i]+1)...(closeIndex[j]-1) {
                        if charInput[k] == "(" || charInput[k] == ")"{
                            cond = false
                        }
                    }
                    
                    if cond {
                        let temp = closeIndex[i]
                        closeIndex[i] = closeIndex[j]
                        closeIndex[j] = temp
                        lowest = closeIndex[i] - openIndex[j]
                    }
                }
            }
        }
        for i in 0...openIndex.count - 1 {
            var temp = [Character]()
            for j in (openIndex[i] + 1)...(closeIndex[i] - 1) {
                temp.append(charInput[j])
            }
            var ctr = temp.count - 1
            for j in (openIndex[i] + 1)...(closeIndex[i] - 1){
                charInput[j] = temp[ctr]
                ctr -= 1
            }
            
        }
        var stringToRet = ""
        for i in 0..<charInput.count {
            if charInput[i] != "(" && charInput[i] != ")" {
                stringToRet += String(charInput[i])
            }
        }
        return stringToRet
        //fatalError("not implemented")
    }
}

class P3Test: XCTestCase {

    func testallLongestStringsTest() {
        XCTAssertEqual(["aba", "vcd", "aba"], P3.allLongestStrings(["aba", "aa", "ad", "vcd", "aba"]))
        XCTAssertEqual(["aa"], P3.allLongestStrings(["aa"]))
        XCTAssertEqual(["eeee", "abcd"], P3.allLongestStrings(["abc", "eeee", "abcd", "dcd"]))
        XCTAssertEqual(["zzzzzz", "abcdef", "aaaaaa"],
                P3.allLongestStrings(["a", "abc", "cbd", "zzzzzz", "a", "abcdef", "asasa", "aaaaaa"]))
        XCTAssertEqual(["varennyky"], P3.allLongestStrings(["enyky", "benyky", "yely", "varennyky"]))
        XCTAssertEqual(["abacaba"], P3.allLongestStrings(["abacaba", "abacab", "abac", "xxxxxx"]))
        XCTAssertEqual(["yooooooung", "watermelon"],
                P3.allLongestStrings(["young", "yooooooung", "hot", "or", "not", "come", "on", "fire", "water", "watermelon"]))
        XCTAssertEqual(["aokbcwthc"], P3.allLongestStrings(["onsfnib", "aokbcwthc", "jrfcw"]))
        XCTAssertEqual(["lbgwyqkry"], P3.allLongestStrings(["lbgwyqkry"]))
        XCTAssertEqual(["i"], P3.allLongestStrings(["i"]))
    }

    func testcommonCharacterCountTest() {
        XCTAssertEqual(3, P3.commonCharacterCount("aabcc", "adcaa"))
        XCTAssertEqual(4, P3.commonCharacterCount("zzzz", "zzzzzzz"))
        XCTAssertEqual(3, P3.commonCharacterCount("abca", "xyzbac"))
        XCTAssertEqual(0, P3.commonCharacterCount("a", "b"))
        XCTAssertEqual(1, P3.commonCharacterCount("a", "aaa"))
    }

    func testisLuckyTest() {
        XCTAssertTrue(P3.isLucky(1230))
        XCTAssertFalse(P3.isLucky(239017))
        XCTAssertTrue(P3.isLucky(134008))
        XCTAssertFalse(P3.isLucky(10))
        XCTAssertTrue(P3.isLucky(11))
        XCTAssertTrue(P3.isLucky(1010))
        XCTAssertFalse(P3.isLucky(261534))
        XCTAssertFalse(P3.isLucky(100000))
        XCTAssertTrue(P3.isLucky(999999))
        XCTAssertTrue(P3.isLucky(123321))
    }

    func testsortByHeightTest() {
        XCTAssertEqual([-1, 150, 160, 170, -1, -1, 180, 190], P3.sortByHeight([-1, 150, 190, 170, -1, -1, 160, 180]))
        XCTAssertEqual([-1, -1, -1, -1, -1], P3.sortByHeight([-1, -1, -1, -1, -1]))
        XCTAssertEqual([-1], P3.sortByHeight([-1]))
        XCTAssertEqual([2, 2, 4, 9, 11, 16], P3.sortByHeight([4, 2, 9, 11, 2, 16]))
        XCTAssertEqual([1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2], P3.sortByHeight([2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1]))
        XCTAssertEqual([1, 3, -1, 23, 43, -1, -1, 54, -1, -1, -1, 77], P3.sortByHeight([23, 54, -1, 43, 1, -1, -1, 77, -1, -1, -1, 3]))
    }

    func testreverseInParenthesesTest() {
        XCTAssertEqual("rab", P3.reverseInParentheses("(bar)"))
        XCTAssertEqual("foorabbaz", P3.reverseInParentheses("foo(bar)baz"))
        XCTAssertEqual("foorabbazmilb", P3.reverseInParentheses("foo(bar)baz(blim)"))
        XCTAssertEqual("foobazrabblim", P3.reverseInParentheses("foo(bar(baz))blim"))
        XCTAssertEqual("", P3.reverseInParentheses(""))
        XCTAssertEqual("", P3.reverseInParentheses("()"))
        XCTAssertEqual("cbadgfe", P3.reverseInParentheses("(abc)d(efg)"))
    }
}

P3Test.defaultTestSuite.run()
