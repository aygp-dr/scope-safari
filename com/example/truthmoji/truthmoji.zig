// TruthMoji implementation in Zig
const std = @import("std");

// TruthMoji struct with atomically incremented usage counter
pub const TruthMoji = struct {
    emoji_true: []const u8,
    emoji_false: []const u8,
    usage_count: std.atomic.Value(usize),

    // Constructor
    pub fn init() TruthMoji {
        return TruthMoji{
            .emoji_true = "😊",
            .emoji_false = "😔",
            .usage_count = std.atomic.Value(usize).init(0),
        };
    }

    // Convert boolean to emoji
    pub fn emojify(self: *TruthMoji, value: bool) []const u8 {
        // Thread-safe increment
        _ = self.usage_count.fetchAdd(1, .monotonic);
        
        return if (value) self.emoji_true else self.emoji_false;
    }

    // Get usage count
    pub fn getUsage(self: *const TruthMoji) usize {
        return self.usage_count.load(.monotonic);
    }
};

// Global instance for module-level access
var g_instance = TruthMoji.init();

// Module API functions
pub fn emojify(value: bool) []const u8 {
    return g_instance.emojify(value);
}

pub fn getUsage() usize {
    return g_instance.getUsage();
}

pub fn main() !void {
    // Demo functionality
    const stdout = std.io.getStdOut().writer();
    
    try stdout.print("=== TruthMoji Demo (Zig) ===\n", .{});
    try stdout.print("true → {s}\n", .{emojify(true)});
    try stdout.print("false → {s}\n", .{emojify(false)});
    try stdout.print("1==1 → {s}\n", .{emojify(1 == 1)});
    try stdout.print("1==0 → {s}\n", .{emojify(1 == 0)});
    try stdout.print("Usage: {d}\n", .{getUsage()});
    
    // Print instance details
    try stdout.print("Inspect: TruthMoji {{ emoji_true: {s}, emoji_false: {s}, usage_count: {d} }}\n", 
        .{g_instance.emoji_true, g_instance.emoji_false, g_instance.getUsage()});
}