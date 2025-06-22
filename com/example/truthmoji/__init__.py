"""com.example.truthmoji - Python implementation with environment inspection"""

import json
import sys
import gc
import os
from datetime import datetime
from pathlib import Path

def capture_environment(label):
    """Capture Python environment state"""
    return {
        'label': label,
        'timestamp': datetime.now().isoformat(),
        'globals_count': len(globals()),
        'locals_count': len(locals()),
        'modules_loaded': len(sys.modules),
        'module_names': list(sys.modules.keys())[:20],  # First 20
        'gc_objects': len(gc.get_objects()),
        'sys_path_length': len(sys.path),
        'dir_contents': os.listdir('.') if os.path.exists('.') else []
    }

def save_environment(env, filename):
    """Save environment to JSON"""
    filepath = Path(__file__).parent / f"{filename}.json"
    with open(filepath, 'w') as f:
        json.dump(env, f, indent=2, default=str)
    print(f"Environment saved to {filepath}")

# Step 1: Initial environment
env1 = capture_environment('initial')
save_environment(env1, 'env-1-python-initial')

# Step 2: Create application
class App:
    name = "TruthMoji App"
    version = "1.0.0"
    users = 0
    
    @classmethod
    def increment_users(cls):
        cls.users += 1

# Create closure example
def make_counter():
    count = 0
    def increment():
        nonlocal count
        count += 1
        return count
    def get_count():
        return count
    return increment, get_count

app_increment, app_get_count = make_counter()
app_increment()

# After app creation
env2 = capture_environment('after-app')
save_environment(env2, 'env-2-python-after-app')

# Step 3: TruthMoji module
# Module-level private state
_emoji_true = "😊"
_emoji_false = "😔"
_usage_count = 0

def emojify(value):
    """Convert boolean to emoji"""
    global _usage_count
    _usage_count += 1
    return _emoji_true if value else _emoji_false

def get_usage():
    """Get usage count"""
    return _usage_count

def inspect():
    """Inspect module internals"""
    return {
        'usage_count': _usage_count,
        'emoji_true': _emoji_true,
        'emoji_false': _emoji_false,
        'module_globals': [k for k in globals().keys() if not k.startswith('__')]
    }

# Alternative implementation using closure
def create_truthmoji():
    """Factory creating a truthmoji with encapsulated state"""
    usage = 0
    emojis = {'true': "😊", 'false': "😔"}
    
    def emojify_closure(value):
        nonlocal usage
        usage += 1
        return emojis['true'] if value else emojis['false']
    
    def get_usage_closure():
        return usage
    
    return emojify_closure, get_usage_closure

# Final environment
env3 = capture_environment('after-truthmoji')
save_environment(env3, 'env-3-python-after-truthmoji')

# Demo
def demo():
    print("\n=== Environment Changes ===")
    print(f"Initial modules: {env1['modules_loaded']}")
    print(f"After truthmoji: {env3['modules_loaded']}")
    print(f"New modules: {env3['modules_loaded'] - env1['modules_loaded']}")
    
    print("\n=== TruthMoji Demo ===")
    print(f"True → {emojify(True)}")
    print(f"False → {emojify(False)}")
    print(f"1 → {emojify(1)}")
    print(f"0 → {emojify(0)}")
    print(f"Usage: {get_usage()}")

if __name__ == "__main__":
    demo()

"""com.example.truthmoji - Python implementation with environment inspection"""

import json
import sys
import gc
import os
from datetime import datetime
from pathlib import Path

def capture_environment(label):
    """Capture Python environment state"""
    return {
        'label': label,
        'timestamp': datetime.now().isoformat(),
        'globals_count': len(globals()),
        'locals_count': len(locals()),
        'modules_loaded': len(sys.modules),
        'module_names': list(sys.modules.keys())[:20],  # First 20
        'gc_objects': len(gc.get_objects()),
        'sys_path_length': len(sys.path),
        'dir_contents': os.listdir('.') if os.path.exists('.') else []
    }

def save_environment(env, filename):
    """Save environment to JSON"""
    filepath = Path(__file__).parent / f"{filename}.json"
    with open(filepath, 'w') as f:
        json.dump(env, f, indent=2, default=str)
    print(f"Environment saved to {filepath}")

# Step 1: Initial environment
env1 = capture_environment('initial')
save_environment(env1, 'env-1-python-initial')

# Step 2: Create application
class App:
    name = "TruthMoji App"
    version = "1.0.0"
    users = 0
    
    @classmethod
    def increment_users(cls):
        cls.users += 1

# Create closure example
def make_counter():
    count = 0
    def increment():
        nonlocal count
        count += 1
        return count
    def get_count():
        return count
    return increment, get_count

app_increment, app_get_count = make_counter()
app_increment()

# After app creation
env2 = capture_environment('after-app')
save_environment(env2, 'env-2-python-after-app')

# Step 3: TruthMoji module
# Module-level private state
_emoji_true = "😊"
_emoji_false = "😔"
_usage_count = 0

def emojify(value):
    """Convert boolean to emoji"""
    global _usage_count
    _usage_count += 1
    return _emoji_true if value else _emoji_false

def get_usage():
    """Get usage count"""
    return _usage_count

def inspect():
    """Inspect module internals"""
    return {
        'usage_count': _usage_count,
        'emoji_true': _emoji_true,
        'emoji_false': _emoji_false,
        'module_globals': [k for k in globals().keys() if not k.startswith('__')]
    }

# Alternative implementation using closure
def create_truthmoji():
    """Factory creating a truthmoji with encapsulated state"""
    usage = 0
    emojis = {'true': "😊", 'false': "😔"}
    
    def emojify_closure(value):
        nonlocal usage
        usage += 1
        return emojis['true'] if value else emojis['false']
    
    def get_usage_closure():
        return usage
    
    return emojify_closure, get_usage_closure

# Final environment
env3 = capture_environment('after-truthmoji')
save_environment(env3, 'env-3-python-after-truthmoji')

# Demo
def demo():
    print("\n=== Environment Changes ===")
    print(f"Initial modules: {env1['modules_loaded']}")
    print(f"After truthmoji: {env3['modules_loaded']}")
    print(f"New modules: {env3['modules_loaded'] - env1['modules_loaded']}")
    
    print("\n=== TruthMoji Demo ===")
    print(f"True → {emojify(True)}")
    print(f"False → {emojify(False)}")
    print(f"1 → {emojify(1)}")
    print(f"0 → {emojify(0)}")
    print(f"Usage: {get_usage()}")

if __name__ == "__main__":
    demo()
