# Dryforge invocation boundary

Only invoke a dryforge skill when the user explicitly enters that skill's dryforge slash command.

Do not select or invoke dryforge from semantic similarity, inferred intent, or an ordinary request to plan,
implement, or migrate work. Those requests are not dryforge invocations, even when they resemble a dryforge
workflow.

Without an explicit dryforge slash command, do not start a dryforge question flow, write dryforge files, or
perform dryforge git operations.
