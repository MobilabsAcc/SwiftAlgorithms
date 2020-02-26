import XCTest

class P2 {

    /**
     * Given an array of integers, find the pair of adjacent elements that has the largest product
     * and return that product.
     * For inputArray = [3, 6, -2, -5, 7, 3], the output should be
     * adjacentElementsProduct(inputArray) = 21. 7 and 3 produce the largest product.
     */
    class func adjacentElementsProduct(_ inputArray: [Int]) -> Int {
        fatalError("not implemented")
    }

    /**
     * Below we will define an n-interesting polygon. Your task is to find the area of a polygon
     * for a given n. A 1-interesting polygon is just a square with a side of length 1. An n-interesting
     * polygon is obtained by taking the n - 1-interesting polygon and appending 1-interesting polygons
     * to its rim, side by side. You can see the 1-, 2-, 3- and 4-interesting polygons in the picture below.
     * For n = 2, the output should be shapeArea(n) = 5;
     * For n = 3, the output should be shapeArea(n) = 13.
     *                                 *
     *                  *            * * *
     *          *     * * *        * * * * *
     *                  *            * * *
     *                                 *
     *          1       2              3
     */
    class func shapeArea(_ n: Int)-> Int {
        fatalError("not implemented")
    }

    /**
     * Ratiorg got statues of different sizes as a present from CodeMaster for his birthday,
     * each statue having an non-negative integer size. Since he likes to make things perfect,
     * he wants to arrange them from smallest to largest so that each statue will be bigger than
     * the previous one exactly by 1. He may need some additional statues to be able to accomplish
     * that. Help him figure out the minimum number of additional statues needed.
     * For statues = [6, 2, 3, 8], the output should be makeArrayConsecutive2(statues) = 3.
     * Ratiorg needs statues of sizes 4, 5 and 7.
     */
    class func makeArrayConsecutive2(_ statuses: [Int])-> Int {
        fatalError("not implemented")
    }

    /**
     * Given a sequence of integers as an array, determine whether it is possible to obtain a strictly
     * increasing sequence by removing no more than one element from the array.
     * Note: sequence a0, a1, ..., an is considered to be a strictly increasing if a0 < a1 < ... < an.
     * Sequence containing only one element is also considered to be strictly increasing.
     * For sequence = [1, 3, 2, 1], the output should be almostIncreasingSequence(sequence) = false.
     * There is no one element in this array that can be removed in order to get a strictly increasing sequence.
     * For sequence = [1, 3, 2], the output should be almostIncreasingSequence(sequence) = true.
     * You can remove 3 from the array to get the strictly increasing sequence [1, 2]. Alternately,
     * you can remove 2 to get the strictly increasing sequence [1, 3].
     */
    class func almostIncreasingSequence(_ sequence: [Int]) -> Bool {
        fatalError("not implemented")
    }

    /**
     * After becoming famous, the CodeBots decided to move into a new building together.
     * Each of the rooms has a different cost, and some of them are free, but there's a rumour that
     * all the free rooms are haunted! Since the CodeBots are quite superstitious, they refuse to stay
     * in any of the free rooms, or any of the rooms below any of the free rooms. Given matrix,
     * a rectangular matrix of integers, where each value represents the cost of the room,
     * your task is to return the total sum of all rooms that are suitable for the CodeBots
     * (ie: add up all the values that don't appear below a 0).
     * For
     * matrix = [[0, 1, 1, 2],
     * [0, 5, 0, 0],
     * [2, 0, 3, 3]]
     * the output should be matrixElementsSum(matrix) = 9.
     * There are several haunted rooms, so we'll disregard them as well as any rooms beneath them.
     * Thus, the answer is 1 + 5 + 1 + 2 = 9.
     * For matrix = [[1, 1, 1, 0],
     * [0, 5, 0, 1],
     * [2, 1, 3, 10]]
     * the output should be matrixElementsSum(matrix) = 9.
     * Note that the free room in the final column makes the full column unsuitable for bots
     * (not just the room directly beneath it). Thus, the answer is 1 + 1 + 1 + 5 + 1 = 9.
     */
    class func matrixElementsSum(_ matrix: [[Int]]) -> Int {
        fatalError("not implemented")
    }

}


class P2Test: XCTestCase {

    func testadjacentElementsProductTest() {
        XCTAssertEqual(21, P2.adjacentElementsProduct([3, 6, -2, -5, 7, 3]))
        XCTAssertEqual(2, P2.adjacentElementsProduct([-1, -2]))
        XCTAssertEqual(6, P2.adjacentElementsProduct([5, 1, 2, 3, 1, 4]))
        XCTAssertEqual(6, P2.adjacentElementsProduct([1, 2, 3, 0]))
        XCTAssertEqual(50, P2.adjacentElementsProduct([9, 5, 10, 2, 24, -1, -48]))
        XCTAssertEqual(30, P2.adjacentElementsProduct([5, 6, -4, 2, 3, 2, -23]))
        XCTAssertEqual(6, P2.adjacentElementsProduct([4, 1, 2, 3, 1, 5]))
        XCTAssertEqual(-12, P2.adjacentElementsProduct([-23, 4, -3, 8, -12]))
        XCTAssertEqual(0, P2.adjacentElementsProduct([1, 0, 1, 0, 1000]))
    }

    func testshapeAreaTest() {
        XCTAssertEqual(5, P2.shapeArea(2))
        XCTAssertEqual(13, P2.shapeArea(3))
        XCTAssertEqual(1, P2.shapeArea(1))
        XCTAssertEqual(41, P2.shapeArea(5))
        XCTAssertEqual(97986001, P2.shapeArea(7000))
        XCTAssertEqual(127984001, P2.shapeArea(8000))
        XCTAssertEqual(199940005, P2.shapeArea(9999))
        XCTAssertEqual(199900013, P2.shapeArea(9998))
        XCTAssertEqual(161946005, P2.shapeArea(8999))
        XCTAssertEqual(19801, P2.shapeArea(100))
    }

    func testmakeArrayConsecutive2Test() {
        XCTAssertEqual(3, P2.makeArrayConsecutive2([6, 2, 3, 8]))
        XCTAssertEqual(2, P2.makeArrayConsecutive2([0, 3]))
        XCTAssertEqual(0, P2.makeArrayConsecutive2([5, 4, 6]))
        XCTAssertEqual(2, P2.makeArrayConsecutive2([6, 3]))
        XCTAssertEqual(0, P2.makeArrayConsecutive2([1]))
    }

    func testalmostIncreasingSequenceTest() {
        XCTAssertFalse(P2.almostIncreasingSequence([1, 3, 2, 1]))
        XCTAssertTrue(P2.almostIncreasingSequence([1, 3, 2]))
        XCTAssertFalse(P2.almostIncreasingSequence([1, 2, 1, 2]))
        XCTAssertFalse(P2.almostIncreasingSequence([3, 6, 5, 8, 10, 20, 15]))
        XCTAssertFalse(P2.almostIncreasingSequence([1, 1, 2, 3, 4, 4]))
        XCTAssertFalse(P2.almostIncreasingSequence([1, 4, 10, 4, 2]))
        XCTAssertTrue(P2.almostIncreasingSequence([10, 1, 2, 3, 4, 5]))
        XCTAssertFalse(P2.almostIncreasingSequence([1, 1, 1, 2, 3]))
        XCTAssertTrue(P2.almostIncreasingSequence([0, -2, 5, 6]))
        XCTAssertFalse(P2.almostIncreasingSequence([1, 2, 3, 4, 5, 3, 5, 6]))
        XCTAssertFalse(P2.almostIncreasingSequence([40, 50, 60, 10, 20, 30]))
        XCTAssertTrue(P2.almostIncreasingSequence([1, 1]))
        XCTAssertTrue(P2.almostIncreasingSequence([1, 2, 5, 3, 5]))
        XCTAssertFalse(P2.almostIncreasingSequence([1, 2, 5, 5, 5]))
        XCTAssertFalse(P2.almostIncreasingSequence([10, 1, 2, 3, 4, 5, 6, 1]))
        XCTAssertTrue(P2.almostIncreasingSequence([1, 2, 3, 4, 3, 6]))
        XCTAssertTrue(P2.almostIncreasingSequence([1, 2, 3, 4, 99, 5, 6]))
        XCTAssertTrue(P2.almostIncreasingSequence([123, -17, -5, 1, 2, 3, 12, 43, 45]))
        XCTAssertTrue(P2.almostIncreasingSequence([3, 5, 67, 98, 3]))
    }

    func testmatrixElementsSumTest() {
        XCTAssertEqual(9, P2.matrixElementsSum([
                [0, 1, 1, 2],
                [0, 5, 0, 0],
                [2, 0, 3, 3]
        ]))
        XCTAssertEqual(9, P2.matrixElementsSum([
                [1, 1, 1, 0],
                [0, 5, 0, 1],
                [2, 1, 3, 10]
        ]))
        XCTAssertEqual(18, P2.matrixElementsSum([
                [1, 1, 1],
                [2, 2, 2],
                [3, 3, 3]
        ]))
        XCTAssertEqual(0, P2.matrixElementsSum([
                [0]
        ]))
        XCTAssertEqual(5, P2.matrixElementsSum([
                [1, 0, 3],
                [0, 2, 1],
                [1, 2, 0]
        ]))
        XCTAssertEqual(6, P2.matrixElementsSum([
                [1],
                [5],
                [0],
                [2]
        ]))
        XCTAssertEqual(15, P2.matrixElementsSum([
                [1, 2, 3, 4, ]
        ]))
        XCTAssertEqual(17, P2.matrixElementsSum([
                [2],
                [5],
                [10]
        ]))
        XCTAssertEqual(15, P2.matrixElementsSum([
                [4, 0, 1],
                [10, 7, 0],
                [0, 0, 0],
                [9, 1,]
        ]))
        XCTAssertEqual(1, P2.matrixElementsSum([
                [1]
        ]))
    }
}

P2Test.defaultTestSuite.run()
