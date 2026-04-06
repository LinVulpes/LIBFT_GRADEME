#!/bin/bash

# Quick Reference Card for Exam

show_quick_reference() {
    cat << 'EOF'
╔════════════════════════════════════════════════════════════╗
║                 EXAM QUICK REFERENCE                       ║
╚════════════════════════════════════════════════════════════╝

📋 WORKFLOW FOR EACH QUESTION:

  1️⃣  Read Subject
      cat exam_session/subject/<question>.txt

  2️⃣  Create Folder
      mkdir -p exam_session/Rendu/<question>
      cd exam_session/Rendu/<question>

  3️⃣  Write Code
      vim <question>.c

  4️⃣  Test Compile
      gcc -Wall -Wextra -Werror <question>.c

  5️⃣  Submit with Git
      cd exam_session/Rendu
      git add <question>
      git status
      git commit -m "<question>"
      git push

  6️⃣  Grade
      Type: grademe

═══════════════════════════════════════════════════════════

🔧 EXAM SHELL COMMANDS:

  status   → Check your level, time, progress
  grademe  → Grade your current solution
  finish   → End the exam
  help     → Show this reference

═══════════════════════════════════════════════════════════

💡 GIT QUICK COMMANDS:

  git status              → See what's staged
  git add <folder>        → Stage your solution
  git commit -m "msg"     → Save your work
  git push                → Submit to server
  git log --oneline       → See commits

═══════════════════════════════════════════════════════════

⚠️  COMMON MISTAKES TO AVOID:

  ✗ Wrong folder name (must match function exactly)
  ✗ Forgetting to test compile before push
  ✗ Not using git status to verify
  ✗ Typos in function name
  ✗ Committing without git add first

═══════════════════════════════════════════════════════════

✅ CHECKLIST BEFORE GRADEME:

  [ ] Folder name matches function name
  [ ] File is named <function>.c
  [ ] Code compiles with -Wall -Wextra -Werror
  [ ] git status shows file is committed
  [ ] git push completed successfully

╚════════════════════════════════════════════════════════════╝

Press ENTER to continue...
EOF
}

# If called directly
if [ "$1" = "show" ]; then
    show_quick_reference
    read
fi
