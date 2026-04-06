# 🎯 COMPLETE EXAM WALKTHROUGH EXAMPLE

This guide walks you through solving `ft_strlen` from start to finish, showing every command and what to expect.

---

## Starting the Exam

```bash
$ ./exam_simulator.sh start

╔════════════════════════════════════════════════════════════╗
║          42 EXAM RANK 02 SIMULATOR                         ║
╚════════════════════════════════════════════════════════════╝

Initializing exam environment...

✓ Exam environment created
✓ Git repository initialized

════════════════════════════════════════════════════════════
Exam started! Good luck! 🚀
════════════════════════════════════════════════════════════

[Quick reference card displays - press ENTER]
```

---

## Level 1 Question Appears

```bash
╔════════════════════════════════════════════════════════════╗
║                    LEVEL 1 STARTING                        ║
╚════════════════════════════════════════════════════════════╝

Your question: ft_strlen

═══════════════════════════════════════════════════════════
Assignment name  : ft_strlen
Expected files   : ft_strlen.c
Allowed functions: None
--------------------------------------------------------------------------------

Write a function that returns the length of a string.

Your function must be declared as follows:

int	ft_strlen(char *str);

Examples:
    ft_strlen("hello")      returns 5
    ft_strlen("")           returns 0
    ft_strlen("42 Network") returns 10
═══════════════════════════════════════════════════════════

📝 STEP-BY-STEP INSTRUCTIONS:

Step 1: Create your solution folder
   mkdir -p exam_session/Rendu/ft_strlen

Step 2: Write your solution
   vim exam_session/Rendu/ft_strlen/ft_strlen.c

Step 3: Test compilation
   gcc -Wall -Wextra -Werror exam_session/Rendu/ft_strlen/ft_strlen.c

Step 4: Submit your solution with git
   cd exam_session/Rendu
   git add ft_strlen
   git status
   git commit -m "ft_strlen"
   git push

Step 5: Grade your solution
   grademe

💡 Quick Copy-Paste Commands:
mkdir -p exam_session/Rendu/ft_strlen && cd exam_session/Rendu/ft_strlen

Available Commands:
  status   - Check exam status and time
  grademe  - Submit and grade your solution
  finish   - End the exam

examshell>
```

---

## Step 1: Create the Folder

```bash
examshell> [Open a new terminal]

$ mkdir -p exam_session/Rendu/ft_strlen
$ cd exam_session/Rendu/ft_strlen
$ pwd
/path/to/exam_session/Rendu/ft_strlen
```

---

## Step 2: Write Your Solution

```bash
$ vim ft_strlen.c
```

**Write this code:**

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

**Save and exit:** `:wq`

---

## Step 3: Test Compilation

```bash
$ gcc -Wall -Wextra -Werror ft_strlen.c

# If successful, you'll see no output (good!)
# If you see errors, fix them before continuing

# Optional: Test with a main function
$ cat > test.c << 'EOF'
#include <stdio.h>

int	ft_strlen(char *str);

int main(void)
{
	printf("%d\n", ft_strlen("hello"));
	printf("%d\n", ft_strlen(""));
	printf("%d\n", ft_strlen("42"));
	return (0);
}
EOF

$ gcc -Wall -Wextra -Werror ft_strlen.c test.c -o test
$ ./test
5
0
2

# Looks good! Clean up test files
$ rm test test.c
```

---

## Step 4: Navigate to Rendu Directory

```bash
$ cd ..
$ pwd
/path/to/exam_session/Rendu

$ ls
ft_strlen/

$ ls ft_strlen/
ft_strlen.c
```

---

## Step 5: Git Add

```bash
$ git add ft_strlen

# You should see no output (good!)
```

---

## Step 6: Git Status (Verify)

```bash
$ git status

On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   ft_strlen/ft_strlen.c
```

**✅ Perfect! The file is staged and ready to commit.**

---

## Step 7: Git Commit

```bash
$ git commit -m "ft_strlen"

[master 1a2b3c4] ft_strlen
 1 file changed, 10 insertions(+)
 create mode 100644 ft_strlen/ft_strlen.c
```

**✅ Commit successful!**

---

## Step 8: Git Push

```bash
$ git push

Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 8 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 345 bytes | 345.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To /path/to/exam_session/Rendu
   9f8e7d6..1a2b3c4  master -> master
```

**✅ Push successful!**

---

## Step 9: Go Back to Exam Shell and Grade

```bash
# Switch back to exam shell terminal

examshell> grademe

╔════════════════════════════════════════════════════════════╗
║  Grading: ft_strlen                                        ║
╚════════════════════════════════════════════════════════════╝

Testing ft_strlen...
✓ ft_strlen("hello")
✓ ft_strlen("")
✓ ft_strlen("42")

═══════════════════════════════════════════════════════════
Tests Passed: 3/3
Tests Failed: 0/3
═══════════════════════════════════════════════════════════

✓ All tests passed!

╔════════════════════════════════════════════════════════════╗
║              LEVEL 1 COMPLETE! 🎉                          ║
╚════════════════════════════════════════════════════════════╝
```

**🎉 Congratulations! You passed Level 1!**

---

## Moving to Level 2

The simulator will automatically start Level 2 with a new random question.

```bash
╔════════════════════════════════════════════════════════════╗
║                    LEVEL 2 STARTING                        ║
╚════════════════════════════════════════════════════════════╝

Your question: ft_atoi

[Process repeats for Level 2...]
```

---

## Common Issues and Solutions

### Issue 1: "File not found" when grading

**Cause:** Folder or file name doesn't match

**Solution:**
```bash
$ ls exam_session/Rendu/
ft_strlne/  # WRONG - typo!

# Fix it:
$ mv exam_session/Rendu/ft_strlne exam_session/Rendu/ft_strlen
```

### Issue 2: "Compilation failed"

**Cause:** Syntax errors in your code

**Solution:**
```bash
$ gcc -Wall -Wextra -Werror exam_session/Rendu/ft_strlen/ft_strlen.c

ft_strlen.c:5:1: error: expected ';' before '}' token
    5 | }
      | ^

# Fix the error in your code, then test again
```

### Issue 3: "Nothing to commit"

**Cause:** Forgot to git add

**Solution:**
```bash
$ git status
On branch master
Untracked files:
  ft_strlen/

# Fix it:
$ git add ft_strlen
$ git commit -m "ft_strlen"
```

### Issue 4: Tests failed

**Cause:** Your code has bugs

**Solution:**
```bash
Testing ft_strlen...
✓ ft_strlen("hello")
✗ ft_strlen("")        # FAILED
   Expected: 0
   Got:      Segmentation fault

# Your code doesn't handle empty strings!
# Fix your code to check for NULL or empty strings
```

---

## Full Terminal Session Example

Here's what a complete successful run looks like:

```bash
Terminal 1 (Exam Shell):
========================
$ ./exam_simulator.sh start
[Exam starts, Level 1 question: ft_strlen]
examshell> status
examshell> grademe
[All tests pass!]
[Level 2 starts...]


Terminal 2 (Your Work):
=======================
$ mkdir -p exam_session/Rendu/ft_strlen
$ cd exam_session/Rendu/ft_strlen
$ vim ft_strlen.c
[Write code, save]
$ gcc -Wall -Wextra -Werror ft_strlen.c
[No errors - good!]
$ cd ..
$ git add ft_strlen
$ git status
[Shows file staged]
$ git commit -m "ft_strlen"
$ git push
[Switch to Terminal 1 and type: grademe]
```

---

## Time Management Example

**Level 1: ft_strlen**
- Read subject: 1 min
- Write code: 3 min
- Test: 1 min
- Git submit: 1 min
- Grade: 30 sec
- **Total: ~7 minutes** ✅

**Level 2: ft_atoi**
- Read subject: 2 min
- Write code: 8 min
- Test: 2 min
- Debug: 3 min
- Git submit: 1 min
- Grade: 30 sec
- **Total: ~17 minutes** ✅

**Level 3: ft_atoi_base**
- Read subject: 2 min
- Write code: 15 min
- Test: 3 min
- Debug: 5 min
- Git submit: 1 min
- Grade: 30 sec
- **Total: ~27 minutes** ✅

**Level 4: ft_split**
- Read subject: 3 min
- Write code: 20 min
- Test: 5 min
- Debug: 8 min
- Git submit: 1 min
- Grade: 30 sec
- **Total: ~38 minutes** ✅

**Complete Exam Time: ~90 minutes** 🎯

---

## Pro Tips

1. **Read carefully** - Make sure you understand what's being asked
2. **Test edge cases** - Empty strings, NULL, negative numbers, zero
3. **Compile often** - Catch errors early
4. **Use git status** - Always verify before committing
5. **Stay calm** - If you fail a level, you can retry

---

## What Success Looks Like

```bash
╔════════════════════════════════════════════════════════════╗
║              🎉 EXAM PASSED! 🎉                            ║
║                                                            ║
║         Congratulations! All levels complete!              ║
╚════════════════════════════════════════════════════════════╝

Total Time: 01:32:45

Great job! You've completed the practice exam.
```

---

**Now you know exactly what to do! Practice this workflow until it becomes second nature.** 🚀

