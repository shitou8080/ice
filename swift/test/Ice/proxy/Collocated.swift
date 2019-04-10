//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import PromiseKit
import Ice
import TestCommon

open class TestFactoryI: TestFactory {
    public class func create() -> TestHelper {
        return Collocated()
    }
}

class Collocated: TestHelperI {
    public override func run(args: [String]) throws {
        let writer = getWriter()

        let (properties, _) = try Ice.createProperties(args: args)
        try properties.setProperty(key: "Ice.ThreadPool.Client.Size", value: "2")
        try properties.setProperty(key: "Ice.ThreadPool.Client.SizeWarn", value: "0")
        try properties.setProperty(key: "Ice.Warn.Dispatch", value: "0")

        let communicator = try self.initialize(properties)
        defer {
            communicator.destroy()
        }
        try communicator.getProperties().setProperty(key: "TestAdapter.Endpoints", value: getTestEndpoint(num: 0))
        let adapter = try communicator.createObjectAdapter("TestAdapter")
        _ = try adapter.add(servant: MyDerivedClassI(), id: Ice.stringToIdentity("test"))
        // try adapter.activate() // Don't activate OA to ensure collocation is used
        _ = try AllTests.allTests(helper: self)
    }
}