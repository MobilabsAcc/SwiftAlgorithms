import XCTest

class P4 {
    /**
     * Several people are standing in a row and need to be divided into two teams.
     * The first person goes into team 1, the second goes into team 2, the third goes into team 1 again,
     * the fourth into team 2, and so on. You are given an array of positive integers - the weights of
     * the people. Return an array of two integers, where the first element is the total weight of
     * team 1, and the second element is the total weight of team 2 after the division is complete.
     */
    class func alternatingSums(_ a: [Int]) -> [Int] {
        var teamOne = 0
        var teamTwo = 0
        for i in 0...a.count - 1 {
            if i%2 == 0{
                teamOne += a[i]
                } else {
                teamTwo += a[i]
            }
        }
        return [teamOne, teamTwo]
        //fatalError("not implemented")
    }

    /**
     * Given a rectangular matrix of characters, add a border of asterisks(*) to it.
     */
    class func addBorder(_ picture: [String]) -> [String] {
        var newArr = picture
        var col = ""
        
        for _ in 0...newArr[0].count - 1{
            col += "*"
        }
        
        
        
        newArr.insert(col, at: 0)
        print(newArr)
        newArr.insert(col, at: newArr.count)
        print(newArr)
        for i in 0...newArr.count - 1{
            let tmp = "*" + newArr[i] + "*"
            newArr[i] = tmp
        }
       
        //print(picture.count) // cols
        //print(picture[0].count) //rows
        return newArr
        //fatalError("not implemented")
    }

    /**
     * Two arrays are called similar if one can be obtained from another by swapping at most one
     * pair of elements in one of the arrays. Given two arrays a and b, check whether they are similar.
     */
    class func areSimilar(_ a: [Int], _ b: [Int]) -> Bool {
        var ctr = 0
        var remOne = 0
        var remTwo = 0
        var similar = false
        for i in 0...a.count - 1{
            if a[i] != b[i] {
                if ctr == 0 {
                    remOne = a[i]
                    remTwo = b[i]
                } else if ctr == 1{
                    if b[i] == remOne && a[i] == remTwo{
                        similar = true
                    }
                } else {
                    similar = false
                }
                ctr += 1
            }
            
        }
        if ctr == 0 {
            similar = true
        }
        return similar
        //fatalError("not implemented")
    }

    /**
     * You are given an array of integers. On each move you are allowed to increase exactly one of
     * its element by one. Find the minimal number of moves required to obtain a strictly
     * increasing sequence from the input.
     */
    class func arrayChange(_ inputArray: [Int]) -> Int {
        var ctr = 0
        var finArr = inputArray
        for i in 1..<inputArray.count {
            if finArr[i] <= finArr[i-1] {
                ctr += finArr[i-1] - finArr[i] + 1
                finArr[i] = finArr[i-1] + 1
            }
        }
        //fatalError("not implemented")
        return ctr
    }

    /**
     * Given a string, find out if its characters can be rearranged to form a palindrome.
     */
    class func palindromeRearranging(_ inputString: String) -> Bool {
        var chars = [Character:Int]()
        for i in inputString {
            if chars.keys.contains(i) {
                chars[i]! += 1
            } else {
                chars[i] = 1
            }
        }
        var pivot = true
        for i in chars.values {
            if i%2 != 0 {
                if pivot {
                    pivot = false
                } else {
                    return pivot
                }
            }
        }
        return true
        //fatalError("not implemented")
    }

}

class P4Test: XCTestCase {

    func testalternatingSumsTest() {
        XCTAssertEqual([180, 105], P4.alternatingSums([50, 60, 60, 45, 70]))
        XCTAssertEqual([100, 50], P4.alternatingSums([100, 50]))
        XCTAssertEqual([80, 0], P4.alternatingSums([80]))
        XCTAssertEqual([150, 150], P4.alternatingSums([100, 50, 50, 100]))
        XCTAssertEqual([150, 151], P4.alternatingSums([100, 51, 50, 100]))
    }

    func testaddBorderTest() {
        XCTAssertEqual([
                "*****",
                "*abc*",
                "*ded*",
                "*****"],
                P4.addBorder([
                        "abc",
                        "ded"]))
        XCTAssertEqual([
                "***",
                "*a*",
                "***"],
                P4.addBorder(["a"]))
        XCTAssertEqual([
                "****",
                "*aa*",
                "****",
                "*zz*",
                "****"],
                P4.addBorder([
                        "aa",
                        "**",
                        "zz"]))
        XCTAssertEqual([
                "*******",
                "*abcde*",
                "*fghij*",
                "*klmno*",
                "*pqrst*",
                "*uvwxy*",
                "*******"],
                P4.addBorder([
                        "abcde",
                        "fghij",
                        "klmno",
                        "pqrst",
                        "uvwxy"]))
        XCTAssertEqual([
                "*******",
                "*wzy***",
                "*******"],
                P4.addBorder(["wzy**"]))
    }

    func testareSimilarTest() {
        XCTAssertTrue(P4.areSimilar([1, 2, 3], [1, 2, 3]))
        XCTAssertTrue(P4.areSimilar([1, 2, 3], [2, 1, 3]))
        XCTAssertFalse(P4.areSimilar([1, 2, 2], [2, 1, 1]))
        XCTAssertFalse(P4.areSimilar([1, 1, 4], [1, 2, 3]))
        XCTAssertFalse(P4.areSimilar([1, 2, 3], [1, 10, 2]))
        XCTAssertTrue(P4.areSimilar([2, 3, 1], [1, 3, 2]))
        XCTAssertFalse(P4.areSimilar([2, 3, 9], [10, 3, 2]))
        XCTAssertFalse(P4.areSimilar([4, 6, 3], [3, 4, 6]))
        XCTAssertTrue(P4.areSimilar([832, 998, 148, 570, 533, 561, 894, 147, 455, 279], [832, 998, 148, 570, 533, 561, 455, 147, 894, 279]))
        XCTAssertFalse(P4.areSimilar([832, 998, 148, 570, 533, 561, 894, 147, 455, 279], [832, 570, 148, 998, 533, 561, 455, 147, 894, 279]))
    }

    func testarrayChangeTest() {
        XCTAssertEqual(3, P4.arrayChange([1, 1, 1]))
        XCTAssertEqual(5, P4.arrayChange([-1000, 0, -2, 0]))
        XCTAssertEqual(12, P4.arrayChange([2, 1, 10, 1]))
        XCTAssertEqual(13, P4.arrayChange([2, 3, 3, 5, 5, 5, 4, 12, 12, 10, 15]))
        XCTAssertEqual(25559, P4.arrayChange([3122, -645, 2616, 13213, -8069]))
        XCTAssertEqual(89510, P4.arrayChange([-787, -773, -93, 867, -28, 118, 372, 255, 355, 598, -179, -752, 794, 961, -84, 296, -714, 14, 666, -265, -905, 942, -691, -379, -698, -650, 637, 523, 709, -674, 574, -239, 805, -434, 597, -677, 664, 384, 726, -389, -387, 772, -603, 685, 249, 446, -631, 454, 983, 867, -158, 932, -440, 891, -12, 400, -916, 503, 185, -802, -255, 207, -952, -506, -689, 425, 747, -907, -30, 102, 553, 981, -664, 75, -957, -42, 99, -750, -277, 686, -884, -972, 470, 32, 439, 163, 887, 895, -555, -654, 793, 333, 143, 73, 181, -512, -915, -68, 542, 799]))
        XCTAssertEqual(2020705, P4.arrayChange([-28943, -29728, -24726, -15090, -2555, -9551, -11025, 36442, -23240, -46093, 48516, 44580, -21573, 39172, -38017, -19354, -13460, 38212, -35646, -22288, 36832, -33115, 39055, -15935, -19300, -10419, -18548, 21742, -32032, 27988, -45323, 27454, -5683, -14209, -4168, 51188, 45552, 9899, 49241, -25939, -8344, -25788, 6808, 6931, 6145, -30802, -518, -42362]))
        XCTAssertEqual(737073, P4.arrayChange([9796, 1283, -2825, 3870, -6727, -8616, -10191, -7727, 7074, 1580, -4583, 162, 2980, -3861, 9452, 8145, 1222, -1125, 5142, -5657, -974, -986, -9627, 5244, 8866, 3336, -9946, -5271, 10582, 3013, 8030, 4471, -3420, 9496, -3533, -8030, 10007, 2549, -8195, 7119, 302, -5322, -3537, 209, -8134, -9176, 6336, -1771, 9851, 3644, 9629, -2603, 3988, 10579, 2221, 1101, 1465, 5002, -6203, -8864, 596, 6005, 4554, 8526, 2178, -5447, -232, -9734, 7402, -3984, -7161, -2139, -3181, 10445, 4535, 6926, 7156]))
        XCTAssertEqual(2199614, P4.arrayChange([-24875, -6401, 58256, 44456, 2244, -25333, -42389, -5975, 7650, -46343, -62011, -55366, 7802, -37699, 15461, 13309, -58664, 54557, 56324, -34397, -33024, -21934, -18861, -23196, 56542, -63986, 59833, -45610, -16948, 399, -7405, 54701, -57348, -32627, 65534, 615]))
        XCTAssertEqual(7097995, P4.arrayChange([22121, 42080, -51776, -28528, 39895, -50842, 25463, 46187, -29518, 42293, -25615, -47412, 24945, -2630, -12717, -23773, -47824, -7768, -23620, -30270, -51644, 42829, 27609, -40734, 2142, 20285, 29665, -36557, -24074, -11996, 30511, 17104, 4360, -41163, 6814, 959, 26613, -15121, -17355, 28424, -11305, 33175, -8585, 23649, -18428, 16770, 14095, 38766, -22425, -45139, -5836, -28668, -15123, -35450, 41353, 11103, -29233, -51990, -14958, 45944, 20841, -34149, 34720, -51760, 23519, -46257, 40985, -32615, -43378, 14243, -24731, 1311, -4236, -24885, 41713, -45195, -14683, 47765, 26904, -51741, 38051, 13429, 38189, -45812, -52474, 14936, 6582, -26313, 4692, 12313, -37502, -40673, 5799, 23264, 33617, -50938, 26268, -25548, -22353, -15175, -21568, 18656, 19208, 20674, 41228, -42538, -45085, -32356, -39901, -39585, -50690, 2859, -4079, 29823, 28849, -2142, -16613, 23378, 36363, 31780, -40379, 7489, -13324, -22377, 35661, -27141, -42727, 10122, -40385, -19765, 33913, -10504, -4715, -18190, 41430, -19134, 32646, 25839, 783, 32941, -25142]))
    }

    func testpalindromeRearrangingTest() {
        XCTAssertTrue(P4.palindromeRearranging("aabb"))
        XCTAssertFalse(P4.palindromeRearranging("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabc"))
        XCTAssertTrue(P4.palindromeRearranging("abbcabb"))
        XCTAssertTrue(P4.palindromeRearranging("zyyzzzzz"))
        XCTAssertTrue(P4.palindromeRearranging("z"))
        XCTAssertTrue(P4.palindromeRearranging("zaa"))
        XCTAssertFalse(P4.palindromeRearranging("abca"))
        XCTAssertFalse(P4.palindromeRearranging("abcad"))
        XCTAssertFalse(P4.palindromeRearranging("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbccccaaaaaaaaaaaaa"))
        XCTAssertFalse(P4.palindromeRearranging("abdhuierf"))
    }
}

P4Test.defaultTestSuite.run()
