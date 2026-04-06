# 📝 EXAM GIT WORKFLOW GUIDE

## Quick Reference for Exam Commands

### Standard Workflow for Each Question

```bash
# 1. CREATE YOUR FOLDER
mkdir -p exam_session/Rendu/ft_strlen
cd exam_session/Rendu/ft_strlen

# 2. WRITE YOUR SOLUTION
vim ft_strlen.c
# or
code ft_strlen.c
# or
nano ft_strlen.c

# 3. TEST COMPILATION (Important!)
gcc -Wall -Wextra -Werror ft_strlen.c

# 4. SUBMIT WITH GIT
cd ..  # Go back to Rendu directory
git add ft_strlen
git status  # Verify it's staged
git commit -m "ft_strlen"
git push

# 5. GRADE IN EXAM SHELL
# Type: grademe
```

---

## Detailed Step-by-Step Guide

### Step 1: Read the Subject

```bash
cat exam_session/subject/ft_strlen.txt
```

This shows you:
- Function name
- Expected files
- Allowed functions
- Function prototype
- Description and examples

### Step 2: Create Your Solution Folder

```bash
# Always create a folder named EXACTLY like the function
mkdir -p exam_session/Rendu/ft_strlen

# Navigate into it
cd exam_session/Rendu/ft_strlen
```

**⚠️ Important:** 
- Folder name must match the function name exactly
- Use the full path to avoid getting lost

### Step 3: Write Your Code

```bash
# Open your editor
vim ft_strlen.c

# Write your function
# Make sure the function name matches exactly!
```

**Example ft_strlen.c:**
```c
int	ft_strlen(char *str)
{
	int	i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}
```

### Step 4: Test Before Submitting (IMPORTANT!)

```bash
# Compile with exam flags
gcc -Wall -Wextra -Werror ft_strlen.c

# If it compiles without errors, you're good!
# If you see errors, fix them before submitting
```

**Common compilation errors:**
- Missing semicolon
- Wrong function name
- Wrong return type
- Unused variables

### Step 5: Git Add

```bash
# Go back to Rendu directory
cd exam_session/Rendu

# Add your folder
git add ft_strlen

# OR add everything (be careful!)
git add .
```

**What this does:**
- Stages your files for commit
- Tells git "I want to save these changes"

### Step 6: Git Status (Verification)

```bash
git status
```

**You should see:**
```
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   ft_strlen/ft_strlen.c
```

**If you see "nothing to commit":**
- You didn't add the files
- Go back to Step 5

### Step 7: Git Commit

```bash
git commit -m "ft_strlen"
```

**What this does:**
- Saves your changes with a message
- Creates a checkpoint in your code history

**Good commit messages:**
- "ft_strlen"
- "ft_strlen solution"
- "level 1 complete"

**Bad commit messages:**
- "" (empty)
- "asdf"
- "done" (not descriptive)

### Step 8: Git Push

```bash
git push
```

**What this does:**
- Uploads your code to the repository
- Makes it available for grading

**If you see an error:**
- Check internet connection
- Make sure you committed first
- Repository might not be set up

### Step 9: Grade Your Solution

```bash
# In the exam shell, type:
grademe
```

**The grader will:**
1. Check if your files exist
2. Compile your code
3. Run test cases
4. Show you pass/fail

---

## Common Git Commands Reference

### Checking Status
```bash
git status              # See what's staged/modified
git log                 # See commit history
git log --oneline       # Compact commit history
```

### Adding Files
```bash
git add filename        # Add specific file
git add folder/         # Add entire folder
git add .               # Add everything (use carefully!)
```

### Committing
```bash
git commit -m "message"          # Commit with message
git commit -m "multi
line message"                    # Multi-line commit
```

### Viewing Changes
```bash
git diff                # See uncommitted changes
git diff filename       # See changes in specific file
```

### Undoing Changes
```bash
git reset HEAD file     # Unstage a file
git checkout -- file    # Discard changes to file
git reset --soft HEAD~1 # Undo last commit (keep changes)
```

---

## Troubleshooting Git Issues

### Problem: "nothing to commit"

```bash
# Solution: Make sure you added files
git status
git add your_folder
git commit -m "message"
```

### Problem: "Changes not staged for commit"

```bash
# Solution: Add the files
git add .
git commit -m "message"
```

### Problem: "fatal: not a git repository"

```bash
# Solution: Navigate to the Rendu directory
cd exam_session/Rendu
git status
```

### Problem: Committed wrong files

```bash
# Solution: Reset the last commit
git reset --soft HEAD~1
# Now add the correct files and commit again
```

### Problem: Want to see what I'm about to commit

```bash
# Solution: Use git status and git diff
git status              # See staged files
git diff --cached       # See what changes are staged
```

---

## Real Exam Git Workflow

In the actual exam, the workflow is the same:

```bash
# 1. Navigate to assignment
cd Rendu
mkdir assignment_name
cd assignment_name

# 2. Code your solution
vim assignment_name.c

# 3. Submit
cd ..
git add assignment_name
git status  # Always verify!
git commit -m "assignment_name"
git push

# 4. In exam terminal, type:
grademe
```

---

## Git Cheat Sheet for Exam

| Command | What It Does |
|---------|-------------|
| `git status` | Check current state |
| `git add <folder>` | Stage your solution |
| `git commit -m "msg"` | Save with message |
| `git push` | Upload to server |
| `git log` | See commit history |
| `git diff` | See changes |

---

## Practice Commands

Try these to get familiar:

```bash
# Practice 1: Create and submit a test file
cd exam_session/Rendu
mkdir test_practice
echo "test" > test_practice/test.c
git add test_practice
git status
git commit -m "practice"
git push

# Practice 2: Check your work
git log
git status

# Practice 3: See what's staged
git add .
git diff --cached
```

---

## Tips for Exam Day

1. **Always check with `git status`** before committing
2. **Compile first** to catch errors early
3. **Use clear commit messages** (function name is fine)
4. **Don't rush** - take 30 seconds to verify before pushing
5. **One folder per function** - keep it organized

---

## Common Mistakes to Avoid

❌ **Wrong:** Committing without testing
```bash
git add . && git commit -m "done" && git push
```

✅ **Right:** Test first, then commit
```bash
gcc -Wall -Wextra -Werror myfile.c
git add myfolder
git status
git commit -m "solution"
git push
```

❌ **Wrong:** Typo in folder name
```bash
mkdir ft_strlne  # Wrong!
```

✅ **Right:** Exact match
```bash
mkdir ft_strlen  # Correct!
```

❌ **Wrong:** Adding unrelated files
```bash
git add .  # Adds everything including junk
```

✅ **Right:** Add only what's needed
```bash
git add ft_strlen
```

---

## Example Full Workflow

Let's do `ft_strlen` from start to finish:

```bash
# 1. Read subject
cat exam_session/subject/ft_strlen.txt

# 2. Create folder and navigate
mkdir -p exam_session/Rendu/ft_strlen
cd exam_session/Rendu/ft_strlen

# 3. Write solution
vim ft_strlen.c
# ... write your code ...
# :wq to save and exit

# 4. Test compilation
gcc -Wall -Wextra -Werror ft_strlen.c
# If no errors, continue

# 5. Go back to Rendu
cd ..

# 6. Add to git
git add ft_strlen

# 7. Verify
git status
# Should show: new file: ft_strlen/ft_strlen.c

# 8. Commit
git commit -m "ft_strlen"
# Should show: 1 file changed, X insertions(+)

# 9. Push
git push
# Should show: successful push

# 10. Grade in exam shell
# Type: grademe
```

---

**Remember:** The exam is about demonstrating you understand C programming AND the git workflow. Practice both! 🚀

