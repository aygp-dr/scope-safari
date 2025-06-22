// com.example.truthmoji - TypeScript implementation
namespace com.example.truthmoji {
  
  interface Environment {
    timestamp: string;
    label: string;
    namespaceKeys: string[];
    typeInfo?: any;
  }
  
  // Step 1: Capture TypeScript namespace state
  function captureEnvironment(label: string): Environment {
    return {
      timestamp: new Date().toISOString(),
      label,
      namespaceKeys: Object.keys(com.example.truthmoji),
      typeInfo: {
        // TypeScript type info is compile-time only
        note: 'Type information erased at runtime'
      }
    };
  }
  
  // Private implementation
  namespace Private {
    export const emojiMap = {
      true: '😊',
      false: '😔'
    } as const;
    
    export let usageCount = 0;
  }
  
  // Public API
  export function emojify(value: boolean): string {
    Private.usageCount++;
    return Private.emojiMap[value];
  }
  
  export function getUsage(): number {
    return Private.usageCount;
  }
  
  // Environment inspection
  export const environments = {
    initial: captureEnvironment('initial'),
    afterModule: null as Environment | null
  };
  
  // Capture after module definition
  environments.afterModule = captureEnvironment('after-module');
}

export = com.example.truthmoji;

// com.example.truthmoji - TypeScript implementation
namespace com.example.truthmoji {
  
  interface Environment {
    timestamp: string;
    label: string;
    namespaceKeys: string[];
    typeInfo?: any;
  }
  
  // Step 1: Capture TypeScript namespace state
  function captureEnvironment(label: string): Environment {
    return {
      timestamp: new Date().toISOString(),
      label,
      namespaceKeys: Object.keys(com.example.truthmoji),
      typeInfo: {
        // TypeScript type info is compile-time only
        note: 'Type information erased at runtime'
      }
    };
  }
  
  // Private implementation
  namespace Private {
    export const emojiMap = {
      true: '😊',
      false: '😔'
    } as const;
    
    export let usageCount = 0;
  }
  
  // Public API
  export function emojify(value: boolean): string {
    Private.usageCount++;
    return Private.emojiMap[value];
  }
  
  export function getUsage(): number {
    return Private.usageCount;
  }
  
  // Environment inspection
  export const environments = {
    initial: captureEnvironment('initial'),
    afterModule: null as Environment | null
  };
  
  // Capture after module definition
  environments.afterModule = captureEnvironment('after-module');
}

export = com.example.truthmoji;
