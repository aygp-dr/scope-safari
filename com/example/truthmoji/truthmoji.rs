// TruthMoji implementation in Rust
use std::sync::atomic::{AtomicUsize, Ordering};

// TruthMoji struct with atomic counter for thread safety
struct TruthMoji {
    emoji_true: String,
    emoji_false: String,
    usage_count: AtomicUsize,
}

impl TruthMoji {
    // Constructor
    fn new() -> Self {
        TruthMoji {
            emoji_true: "😊".to_string(),
            emoji_false: "😔".to_string(),
            usage_count: AtomicUsize::new(0),
        }
    }
    
    // Convert boolean to emoji
    fn emojify(&self, value: bool) -> &str {
        // Thread-safe increment
        self.usage_count.fetch_add(1, Ordering::SeqCst);
        
        if value {
            &self.emoji_true
        } else {
            &self.emoji_false
        }
    }
    
    // Get usage count
    fn get_usage(&self) -> usize {
        self.usage_count.load(Ordering::SeqCst)
    }
    
    // Inspect internal state
    fn inspect(&self) -> String {
        format!(
            "TruthMoji {{ emoji_true: {}, emoji_false: {}, usage_count: {} }}",
            self.emoji_true, self.emoji_false, self.get_usage()
        )
    }
}

fn main() {
    // Create a new TruthMoji instance
    let tm = TruthMoji::new();
    
    // Demo functionality
    println!("=== TruthMoji Demo (Rust) ===");
    println!("true → {}", tm.emojify(true));
    println!("false → {}", tm.emojify(false));
    println!("1==1 → {}", tm.emojify(1 == 1));
    println!("1==0 → {}", tm.emojify(1 == 0));
    println!("Usage: {}", tm.get_usage());
    println!("Inspect: {}", tm.inspect());
}