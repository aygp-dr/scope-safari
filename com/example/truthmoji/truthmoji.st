"TruthMoji implementation in Smalltalk
 This demonstrates Smalltalk's object-oriented approach and closures."

"Define the TruthMoji class"
Object subclass: TruthMoji [
    | usageCount emojiTrue emojiFalse |
    
    "Class initialization"
    TruthMoji class >> new [
        | instance |
        instance := super new.
        instance initialize.
        ^instance
    ]
    
    "Instance initialization"
    initialize [
        usageCount := 0.
        emojiTrue := '😊'.
        emojiFalse := '😔'.
    ]
    
    "Convert boolean to emoji"
    emojify: aBoolean [
        usageCount := usageCount + 1.
        ^aBoolean 
            ifTrue: [emojiTrue] 
            ifFalse: [emojiFalse]
    ]
    
    "Get usage count"
    getUsage [
        ^usageCount
    ]
    
    "Inspect internal state - demonstrates encapsulation"
    inspect [
        ^Dictionary new
            at: 'usageCount' put: usageCount;
            at: 'emojiTrue' put: emojiTrue;
            at: 'emojiFalse' put: emojiFalse;
            yourself
    ]
]

"Create a singleton instance - demonstrates Smalltalk's approach to module-like organization"
Smalltalk at: #TruthMojiInstance put: TruthMoji new.

"Demo functionality"
Transcript show: '=== TruthMoji Demo (Smalltalk) ==='; cr.
Transcript show: 'true → ', (TruthMojiInstance emojify: true); cr.
Transcript show: 'false → ', (TruthMojiInstance emojify: false); cr.
Transcript show: '1 → ', (TruthMojiInstance emojify: 1 = 1); cr.
Transcript show: '0 → ', (TruthMojiInstance emojify: 0 = 1); cr.
Transcript show: 'Usage: ', (TruthMojiInstance getUsage) printString; cr.
Transcript show: 'Inspect: ', (TruthMojiInstance inspect) printString; cr.