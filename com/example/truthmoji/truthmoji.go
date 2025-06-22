// TruthMoji implementation in Go
package main

import (
	"fmt"
	"sync/atomic"
)

// TruthMoji encapsulates the emoji conversion functionality
type TruthMoji struct {
	emojiTrue   string
	emojiFalse  string
	usageCount  atomic.Int64 // Thread-safe counter
}

// NewTruthMoji creates a new TruthMoji instance
func NewTruthMoji() *TruthMoji {
	tm := &TruthMoji{
		emojiTrue:  "😊",
		emojiFalse: "😔",
	}
	return tm
}

// Emojify converts a boolean value to an emoji
func (tm *TruthMoji) Emojify(value bool) string {
	tm.usageCount.Add(1) // Thread-safe increment
	
	if value {
		return tm.emojiTrue
	}
	return tm.emojiFalse
}

// GetUsage returns the current usage count
func (tm *TruthMoji) GetUsage() int64 {
	return tm.usageCount.Load() // Thread-safe read
}

// Inspect returns a map of internal state for inspection
func (tm *TruthMoji) Inspect() map[string]interface{} {
	return map[string]interface{}{
		"emojiTrue":  tm.emojiTrue,
		"emojiFalse": tm.emojiFalse,
		"usageCount": tm.GetUsage(),
	}
}

func main() {
	// Create a new TruthMoji instance
	tm := NewTruthMoji()
	
	// Demo functionality
	fmt.Println("=== TruthMoji Demo (Go) ===")
	fmt.Println("true →", tm.Emojify(true))
	fmt.Println("false →", tm.Emojify(false))
	fmt.Println("1==1 →", tm.Emojify(1 == 1))
	fmt.Println("1==0 →", tm.Emojify(1 == 0))
	fmt.Printf("Usage: %d\n", tm.GetUsage())
	
	// Demonstrate inspection
	fmt.Println("Inspect:", tm.Inspect())
}