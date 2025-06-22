/**
 * TruthMoji implementation in C
 * Demonstrates static variables and modular C programming
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdatomic.h>

/* TruthMoji structure */
typedef struct {
    const char* emoji_true;
    const char* emoji_false;
    atomic_int usage_count;
} TruthMoji;

/* Initialize a TruthMoji instance */
void truthmoji_init(TruthMoji* tm) {
    tm->emoji_true = "😊";
    tm->emoji_false = "😔";
    atomic_init(&tm->usage_count, 0);
}

/* Convert boolean to emoji */
const char* truthmoji_emojify(TruthMoji* tm, bool value) {
    /* Thread-safe increment */
    atomic_fetch_add(&tm->usage_count, 1);
    
    return value ? tm->emoji_true : tm->emoji_false;
}

/* Get current usage count */
int truthmoji_get_usage(TruthMoji* tm) {
    return atomic_load(&tm->usage_count);
}

/* Print internal state */
void truthmoji_inspect(TruthMoji* tm) {
    printf("TruthMoji { emoji_true: %s, emoji_false: %s, usage_count: %d }\n",
           tm->emoji_true, tm->emoji_false, truthmoji_get_usage(tm));
}

/* Module-level singleton (static instance) */
static TruthMoji g_instance;

/* Module initialization function (called before main) */
__attribute__((constructor))
static void init_module(void) {
    truthmoji_init(&g_instance);
}

/* Public API functions using the singleton */
const char* emojify(bool value) {
    return truthmoji_emojify(&g_instance, value);
}

int get_usage(void) {
    return truthmoji_get_usage(&g_instance);
}

void inspect(void) {
    truthmoji_inspect(&g_instance);
}

/* Demo program */
int main(void) {
    printf("=== TruthMoji Demo (C) ===\n");
    printf("true → %s\n", emojify(true));
    printf("false → %s\n", emojify(false));
    printf("1==1 → %s\n", emojify(1 == 1));
    printf("1==0 → %s\n", emojify(1 == 0));
    printf("Usage: %d\n", get_usage());
    printf("Inspect: ");
    inspect();
    
    return 0;
}