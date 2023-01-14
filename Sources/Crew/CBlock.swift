// Glue code to allow contextual block callbacks from C functions

import Foundation
import CLib

@usableFromInline
typealias AnyPtr = UnsafeMutableRawPointer?

@inlinable @inline(__always)
func MakeRetainedPtr <T: AnyObject>(_ obj: T) -> AnyPtr {
    return Unmanaged.passRetained(obj).toOpaque()
}

@inlinable @inline(__always)
func MakeRetainedClass <T: AnyObject>(_ ptr: AnyPtr) -> T? {
    guard let ptr = ptr else { return nil }
    return Unmanaged<T>.fromOpaque(ptr).takeUnretainedValue()
}

@inlinable @inline(__always)
func MakeReleasedClass <T: AnyObject>(_ ptr: AnyPtr) -> T? {
    guard let ptr = ptr else { return nil }
    return Unmanaged<T>.fromOpaque(ptr).takeRetainedValue()
}

public class CBlock {
    @inlinable @inline(__always)
    static public func call(_ cFunc: CBlockCallback,
                            _ arg0: String? = nil,
                            _ arg1: String? = nil,
                            _ arg2: String? = nil,
                            _ arg3: String? = nil,
                            _ arg4: String? = nil,
                            _ arg5: String? = nil,
                            _ arg6: String? = nil,
                            _ body: @escaping (String?, String?, String?, String?, String?, String?, String?) -> ()) {
        let blockPtr = MakeRetainedPtr(CBlock(body))
        cFunc(blockPtr, arg0, arg1, arg2, arg3, arg4, arg5, arg6) { contextPtr, ret0, ret1, ret2, ret3, ret4, ret5, ret6 in
            if let block: CBlock = MakeRetainedClass(contextPtr) {
                var string0: String? = nil
                if let ret0 = ret0 {
                    string0 = String(utf8String: ret0)
                }
                var string1: String? = nil
                if let ret1 = ret1 {
                    string1 = String(utf8String: ret1)
                }
                var string2: String? = nil
                if let ret2 = ret2 {
                    string2 = String(utf8String: ret2)
                }
                var string3: String? = nil
                if let ret3 = ret3 {
                    string3 = String(utf8String: ret3)
                }
                var string4: String? = nil
                if let ret4 = ret4 {
                    string4 = String(utf8String: ret4)
                }
                var string5: String? = nil
                if let ret5 = ret5 {
                    string5 = String(utf8String: ret5)
                }
                var string6: String? = nil
                if let ret6 = ret6 {
                    string6 = String(utf8String: ret6)
                }
                
                block.call(string0,
                           string1,
                           string2,
                           string3,
                           string4,
                           string5,
                           string6)
            }
        }
    }
    
    public let block: (String?, String?, String?, String?, String?, String?, String?) -> ()
    public init(_ block: @escaping (String?, String?, String?, String?, String?, String?, String?) -> ()) {
        self.block = block
    }
    @inlinable @inline(__always)
    func call(_ arg0: String?,
              _ arg1: String?,
              _ arg2: String?,
              _ arg3: String?,
              _ arg4: String?,
              _ arg5: String?,
              _ arg6: String?) -> () {
        block(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
    }
}
