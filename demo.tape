# vhs tape for omarchy-audit demo
# Regenerate GIF: vhs demo.tape
# Output: demo.gif (committed to repo)

Output demo.gif

Set FontSize 14
Set Width 1100
Set Height 700
Set Theme "Catppuccin Mocha"
Set Padding 20
Set TypingSpeed 40ms

# Force English UI for the demo (most viewers won't read Spanish)
Env OMARCHY_AUDIT_LANG "en"

Type "omarchy-audit"
Sleep 500ms
Enter
Sleep 3s

# Move to "Review my packages"
Sleep 1500ms
Enter
Sleep 3s

# Browse the picker — descriptions + sizes visible
Down 5
Sleep 1500ms
Down 5
Sleep 1500ms

# Don't actually remove anything — just escape to show the safety
Escape
Sleep 1500ms

# Back to main menu, show orphans
Enter
Sleep 1s
Down
Sleep 500ms
Enter
Sleep 2500ms
Escape
Sleep 1s

# Final dashboard pause
Enter
Sleep 1s
Down 4
Enter
Sleep 2500ms
