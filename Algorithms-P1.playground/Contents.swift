import XCTest
import Foundation

class P1 {

    /**
     * Write a function that returns the sum of two numbers.
     * For param1 = 1 and param2 = 2, the output should be add(param1, param2) = 3.
     */
    class func add(_ param1: Int, _ param2: Int) -> Int {
        return param1 + param2
        //fatalError("not implemented")
    }

    /**
     * Given a year, return the century it is in. The first century spans from the year 1 up to and
     * including the year 100, the second - from the year 101 up to and including the year 200, etc.
     * For year = 1905, the output should be centuryFromYear(year) = 20;
     * For year = 1700, the output should be centuryFromYear(year) = 17.
     */
    class func centuryFromYear(_ year: Int) -> Int {
        if year%100 == 0 {
            return year/100
        }
        return year/100 + 1
        //fatalError("not implemented")
    }

    /**
     * Given the string, check if it is a palindrome.
     * For inputString = "aabaa", the output should be checkPalindrome(inputString) = true;
     * For inputString = "abac", the output should be checkPalindrome(inputString) = false;
     * For inputString = "a", the output should be checkPalindrome(inputString) = true.
     */
    class func checkPalindrome(_ inputString: String) -> Bool {
        let str = Array(inputString)
        for i in 0...str.count - 1{
            if str[i] != str[str.count - 1 - i] {
                return false
            }
        }
        return true
        //fatalError("not implemented")
    }
}



class P1Tests: XCTestCase {

    
    func testAdd() {
        XCTAssertEqual(3, P1.add(1, 2))
        XCTAssertEqual(1000, P1.add(0, 1000))
        XCTAssertEqual(-37, P1.add(2, -39))
        XCTAssertEqual(199, P1.add(99, 100))
        XCTAssertEqual(0, P1.add(100, -100))
        XCTAssertEqual(-2000, P1.add(-1000, -1000))
    }
    
    func testCenturyFromYear() {
        XCTAssertEqual(20, P1.centuryFromYear(1905))
        XCTAssertEqual(17, P1.centuryFromYear(1700))
        XCTAssertEqual(20, P1.centuryFromYear(1998))
        XCTAssertEqual(20, P1.centuryFromYear(2000))
        XCTAssertEqual(21, P1.centuryFromYear(2001))
        XCTAssertEqual(2, P1.centuryFromYear(200))
        XCTAssertEqual(4, P1.centuryFromYear(374))
        XCTAssertEqual(1, P1.centuryFromYear(45))
        XCTAssertEqual(1, P1.centuryFromYear(8))
    }

    func testCheckPalindrome() {
        XCTAssertTrue(P1.checkPalindrome("aabaa"))
        XCTAssertFalse(P1.checkPalindrome("abac"))
        XCTAssertTrue(P1.checkPalindrome("a"))
        XCTAssertFalse(P1.checkPalindrome("az"))
        XCTAssertTrue(P1.checkPalindrome("abacaba"))
        XCTAssertTrue(P1.checkPalindrome("z"))
        XCTAssertFalse(P1.checkPalindrome("aaabaaaa"))
        XCTAssertFalse(P1.checkPalindrome("zzzazzazz"))
        XCTAssertTrue(P1.checkPalindrome("hlbeeykoqqqqokyeeblh"))
        XCTAssertTrue(P1.checkPalindrome("hlbeeykoqqqokyeeblh"))
    }
}

P1Tests.defaultTestSuite.run()

