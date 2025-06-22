// com.example.truthmoji - JavaScript implementation
// Step 1: Inspect initial environment

const fs = require('fs');
const path = require('path');

// Capture initial environment
function captureEnvironment(label) {
  const env = {
    timestamp: new Date().toISOString(),
    label: label,
    globalKeys: Object.keys(globalThis).sort(),
    globalCount: Object.keys(globalThis).length,
    moduleKeys: Object.keys(module.exports),
    processEnv: process.env.NODE_ENV,
    __filename: __filename,
    __dirname: __dirname,
    requireCache: Object.keys(require.cache),
    memoryUsage: process.memoryUsage()
  };
  
  return env;
}

// Save environment to disk
function saveEnvironment(env, filename) {
  const envPath = path.join(__dirname, `${filename}.json`);
  fs.writeFileSync(envPath, JSON.stringify(env, null, 2));
  console.log(`Environment saved to ${envPath}`);
}

// Step 1: Capture initial state
const env1 = captureEnvironment('initial');
saveEnvironment(env1, 'env-1-initial');

// Step 2: Create our "application" with some state
const appState = {
  name: 'TruthMoji App',
  version: '1.0.0',
  users: 0
};

// Add some globals (pollution for demonstration)
globalThis.APP_STATE = appState;
globalThis.magicNumber = 42;

// Create a closure to demonstrate scope
const createCounter = () => {
  let count = 0;
  return {
    increment: () => ++count,
    getCount: () => count
  };
};

const appCounter = createCounter();
appCounter.increment();

// Step 3: Capture environment after app creation
const env2 = captureEnvironment('after-app');
saveEnvironment(env2, 'env-2-after-app');

// Step 4: Define the truthmoji module
const truthmoji = (() => {
  // Private scope - not accessible outside
  const emojiMap = {
    true: '😊',
    false: '😔'
  };
  
  // Track usage in closure
  let usageCount = 0;
  
  // Public API
  return {
    emojify: (bool) => {
      usageCount++;
      return emojiMap[!!bool];
    },
    getUsage: () => usageCount,
    // Expose internals for inspection
    __inspect: () => ({
      emojiMap,
      usageCount,
      closureScope: 'truthmoji module'
    })
  };
})();

// Export for use
module.exports = { truthmoji, captureEnvironment, saveEnvironment };

// Step 5: Capture final environment
const env3 = captureEnvironment('after-truthmoji');
saveEnvironment(env3, 'env-3-after-truthmoji');

// Compare environments
console.log('\n=== Environment Changes ===');
console.log(`Initial global count: ${env1.globalCount}`);
console.log(`After app global count: ${env2.globalCount}`);
console.log(`New globals:`, env2.globalKeys.filter(k => !env1.globalKeys.includes(k)));

// Demo usage
console.log('\n=== TruthMoji Demo ===');
console.log(`true → ${truthmoji.emojify(true)}`);
console.log(`false → ${truthmoji.emojify(false)}`);
console.log(`1 → ${truthmoji.emojify(1)}`);
console.log(`0 → ${truthmoji.emojify(0)}`);
console.log(`Usage count: ${truthmoji.getUsage()}`);