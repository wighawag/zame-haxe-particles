package org.zamedev.particles.internal;

// taken from lime.math.Vector4 (for older openfl versions)

class Vector4 {
    public static var X_AXIS(get, null) : Vector4;
    public static var Y_AXIS(get, null) : Vector4;
    public static var Z_AXIS(get, null) : Vector4;

    public var length(get, null) : Float;
    public var lengthSquared(get, null) : Float;
    public var w : Float;
    public var x : Float;
    public var y : Float;
    public var z : Float;

    public function new(x : Float = 0.0, y : Float = 0.0, z : Float = 0.0, w : Float = 0.0) : Void {
        this.w = w;
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public inline function add(a : Vector4) : Vector4 {
        return new Vector4(this.x + a.x, this.y + a.y, this.z + a.z);
    }

    public inline function clone() : Vector4 {
        return new Vector4(x, y, z, w);
    }

    public inline function copyFrom(sourceVector4 : Vector4) : Void {
        x = sourceVector4.x;
        y = sourceVector4.y;
        z = sourceVector4.z;
    }

    public inline function crossProduct(a : Vector4) : Vector4 {
        return new Vector4(y * a.z - z * a.y, z * a.x - x * a.z, x * a.y - y * a.x, 1.0);
    }

    public inline function decrementBy(a : Vector4) : Void {
        x -= a.x;
        y -= a.y;
        z -= a.z;
    }

    public inline function dotProduct(a : Vector4) : Float {
        return x * a.x + y * a.y + z * a.z;
    }

    public inline function equals(toCompare : Vector4, allFour : Bool = false) : Bool {
        return (x == toCompare.x && y == toCompare.y && z == toCompare.z && (!allFour || w == toCompare.w));
    }

    public inline function incrementBy(a : Vector4) : Void {
        x += a.x;
        y += a.y;
        z += a.z;
    }

    public inline function nearEquals(toCompare : Vector4, tolerance : Float, allFour:Bool = false) : Bool {
        return (Math.abs(x - toCompare.x) < tolerance
            && Math.abs(y - toCompare.y) < tolerance
            && Math.abs(z - toCompare.z) < tolerance
            && (!allFour || Math.abs (w - toCompare.w) < tolerance)
        );
    }

    public inline function negate() : Void {
        x *= -1.0;
        y *= -1.0;
        z *= -1.0;
    }

    public inline function normalize() : Float {
        var l = length;

        if (l != 0.0) {
            x /= l;
            y /= l;
            z /= l;
        }

        return l;
    }

    public inline function project() : Void {
        x /= w;
        y /= w;
        z /= w;
    }

    public inline function scaleBy(s : Float) : Void {
        x *= s;
        y *= s;
        z *= s;
    }

    public inline function setTo(xa : Float, ya : Float, za : Float) : Void {
        x = xa;
        y = ya;
        z = za;
    }

    public inline function subtract(a : Vector4) : Vector4 {
        return new Vector4(x - a.x, y - a.y, z - a.z);
    }

    public inline function toString() : String {
        return 'Vector4(${x}, ${y}, ${z})';
    }

    public inline function get_length() : Float {
        return Math.sqrt(x * x + y * y + z * z);
    }

    public inline function get_lengthSquared() : Float {
        return (x * x + y * y + z * z);
    }

    public static inline function angleBetween(a : Vector4, b : Vector4) : Float {
        var a0 = a.clone();
        a0.normalize();

        var b0 = b.clone();
        b0.normalize();

        return Math.acos(a0.dotProduct(b0));
    }

    public static inline function distance(pt1 : Vector4, pt2 : Vector4) : Float {
        var x : Float = pt2.x - pt1.x;
        var y : Float = pt2.y - pt1.y;
        var z : Float = pt2.z - pt1.z;

        return Math.sqrt(x * x + y * y + z * z);
    }

    public static inline function get_X_AXIS() : Vector4 {
        return new Vector4(1.0, 0.0, 0.0);
    }

    public static inline function get_Y_AXIS() : Vector4 {
        return new Vector4(0.0, 1.0, 0.0);
    }

    public static inline function get_Z_AXIS() : Vector4 {
        return new Vector4(0.0, 0.0, 1.0);
    }
}
