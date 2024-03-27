import "forge-std/Test.sol";
import "../src/constructor_payable.sol";


contract ExampleTest2 is Test {
    ConstructorPayable public a;
    C public c;

    function setUp() public {
        c = new C();
        // a = new ConstructorPayable();
        a = new ConstructorPayable{value: 5 ether}(address(c));
    }

    function testExample() public {
        assertEq(address(a).balance, 5 ether);
        // a.withdraw("");
        // assertEq(address(a).balance, 5 ether);
        // assertEq(a.errorsCount(), 1);
        a.withdraw("xpto");
        assertEq(address(a).balance, 0 ether);
        assertEq(a.errorsCount(), 0);
    }

}

contract C {
    receive() external payable {
    }
}