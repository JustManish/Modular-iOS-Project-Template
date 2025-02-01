import XCTest
@testable import DependencyContainer

final class DependencyContainerTests: XCTestCase {
    
    var sut: DependencyContainer!

    override func setUp() {
        super.setUp()
        sut = .init()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_single_instance_registration_and_resolving() {
        let instance = SingleInstanceImplementation()
        sut.register(type: .singleInstance(instance), for: SingleInstanceProtocol.self)

        let resolvedInstance = sut.resolve(type: .singleInstance, for: SingleInstanceProtocol.self)
        XCTAssert(instance === resolvedInstance)
    }

    func test_closure_based_registration_and_resolving() {
        let closure: () -> ClosureBasedProtocol = {
            ClosureBasedImplementation()
        }
        sut.register(type: .closureBased(closure), for: ClosureBasedProtocol.self)

        let resolved = sut.resolve(type: .closureBased, for: ClosureBasedProtocol.self)
        XCTAssert(resolved is ClosureBasedImplementation)
    }

    func test_closure_based_dependency_that_depends_on_another() {
        let closure: () -> ClosureBasedProtocol = {
            ClosureBasedImplementation()
        }
        sut.register(type: .closureBased(closure), for: ClosureBasedProtocol.self)

        let anotherDependencyClosure: () -> AnotherDependencyProtocol = {
            let service = self.sut.resolve(type: .closureBased, for: ClosureBasedProtocol.self)
            let anotherDependency = AnotherDependencyImplementation(service: service)
            return anotherDependency
        }
        sut.register(type: .closureBased(anotherDependencyClosure), for: AnotherDependencyProtocol.self)

        let resolvedAnotherDependency = sut.resolve(type: .closureBased, for: AnotherDependencyProtocol.self)
    }
}
