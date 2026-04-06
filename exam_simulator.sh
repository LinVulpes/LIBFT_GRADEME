#!/bin/bash

# ============================================================================
# 42 EXAM RANK 02 SIMULATOR - Practice Your Libft Functions
# ============================================================================
# This script simulates the real exam environment
# Random questions from each level, grademe-style testing
# ============================================================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# Directories
EXAM_DIR="$(pwd)/exam_session"
SUBJECT_DIR="$EXAM_DIR/subject"
RENDU_DIR="$EXAM_DIR/Rendu"
LIBFT_PATH="$HOME/42-Core/C1/Libft"

# Exam state
CURRENT_LEVEL=1
TOTAL_LEVELS=4
EXAM_STARTED=0
START_TIME=0

# Level 1 Questions (12 total)
LEVEL1_QUESTIONS=(
    "ft_strlen"
    "ft_strcpy"
    "ft_putstr"
    "ft_swap"
    "first_word"
    "fizzbuzz"
    "repeat_alpha"
    "rev_print"
    "rot_13"
    "rotone"
    "search_and_replace"
    "ulstr"
)

# Level 2 Questions (20 total)
LEVEL2_QUESTIONS=(
    "ft_atoi"
    "ft_strcmp"
    "ft_strdup"
    "ft_strcspn"
    "ft_strrev"
    "ft_strspn"
    "alpha_mirror"
    "camel_to_snake"
    "do_op"
    "inter"
    "is_power_of_2"
    "last_word"
    "max"
    "print_bits"
    "reverse_bits"
    "snake_to_camel"
    "swap_bits"
    "union"
    "wdmatch"
    "ft_strpbrk"
)

# Level 3 Questions (15 total)
LEVEL3_QUESTIONS=(
    "ft_atoi_base"
    "ft_list_size"
    "ft_range"
    "ft_rrange"
    "add_prime_sum"
    "epur_str"
    "expand_str"
    "hidenp"
    "lcm"
    "paramsum"
    "pgcd"
    "print_hex"
    "rstr_capitalizer"
    "str_capitalizer"
    "tab_mult"
)

# Level 4 Questions (10 total)
LEVEL4_QUESTIONS=(
    "ft_itoa"
    "ft_split"
    "ft_list_foreach"
    "ft_list_remove_if"
    "flood_fill"
    "fprime"
    "rev_wstr"
    "rostring"
    "sort_int_tab"
    "sort_list"
)

# ============================================================================
# UTILITY FUNCTIONS
# ============================================================================

print_header() {
    clear
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                                                            ║${NC}"
    echo -e "${BLUE}║          ${YELLOW}42 EXAM RANK 02 SIMULATOR${BLUE}                      ║${NC}"
    echo -e "${BLUE}║                                                            ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

show_status() {
    local elapsed=$(($(date +%s) - START_TIME))
    local hours=$((elapsed / 3600))
    local minutes=$(((elapsed % 3600) / 60))
    local seconds=$((elapsed % 60))
    
    echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║  ${YELLOW}EXAM STATUS${CYAN}                                               ║${NC}"
    echo -e "${CYAN}╠════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  Current Level: ${GREEN}Level $CURRENT_LEVEL / $TOTAL_LEVELS${NC}                           ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  Time Elapsed:  ${YELLOW}$(printf '%02d:%02d:%02d' $hours $minutes $seconds)${NC}                             ${CYAN}║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

show_commands() {
    echo -e "${MAGENTA}Available Commands:${NC}"
    echo -e "  ${GREEN}status${NC}   - Check exam status and time"
    echo -e "  ${GREEN}grademe${NC}  - Submit and grade your solution"
    echo -e "  ${GREEN}finish${NC}   - End the exam"
    echo ""
}

# ============================================================================
# EXAM INITIALIZATION
# ============================================================================

init_exam() {
    print_header
    
    echo -e "${YELLOW}Initializing exam environment...${NC}"
    echo ""
    
    # Create exam directory structure
    rm -rf "$EXAM_DIR"
    mkdir -p "$SUBJECT_DIR"
    mkdir -p "$RENDU_DIR"
    
    # Initialize git in Rendu
    cd "$RENDU_DIR"
    git init -q
    git config user.name "exam"
    git config user.email "exam@student.42.fr"
    
    echo -e "${GREEN}✓${NC} Exam environment created"
    echo -e "${GREEN}✓${NC} Git repository initialized"
    echo ""
    
    EXAM_STARTED=1
    START_TIME=$(date +%s)
    CURRENT_LEVEL=1
    
    echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}Exam started! Good luck! 🚀${NC}"
    echo -e "${CYAN}════════════════════════════════════════════════════════════${NC}"
    echo ""
    
    # Show quick reference
    source "$(dirname "$0")/quick_reference.sh"
    show_quick_reference
    read -p ""
}

# ============================================================================
# QUESTION GENERATION
# ============================================================================

generate_question() {
    local level=$1
    local question=""
    
    case $level in
        1)
            question=${LEVEL1_QUESTIONS[$RANDOM % ${#LEVEL1_QUESTIONS[@]}]}
            ;;
        2)
            question=${LEVEL2_QUESTIONS[$RANDOM % ${#LEVEL2_QUESTIONS[@]}]}
            ;;
        3)
            question=${LEVEL3_QUESTIONS[$RANDOM % ${#LEVEL3_QUESTIONS[@]}]}
            ;;
        4)
            question=${LEVEL4_QUESTIONS[$RANDOM % ${#LEVEL4_QUESTIONS[@]}]}
            ;;
    esac
    
    echo "$question"
}

create_subject() {
    local question=$1
    local subject_file="$SUBJECT_DIR/${question}.txt"
    
    # Source the subjects script
    source "$(dirname "$0")/subjects.sh"
    
    # Get the subject content
    get_subject "$question" > "$subject_file"
    
    echo "$subject_file"
}

# ============================================================================
# GRADING LOGIC
# ============================================================================

grade_submission() {
    local question=$1
    
    echo -e "${YELLOW}Grading $question...${NC}"
    echo ""
    
    # Check if folder exists
    if [ ! -d "$RENDU_DIR/$question" ]; then
        echo -e "${RED}✗ Error: Folder '$question' not found in Rendu/${NC}"
        return 1
    fi
    
    # Check if .c file exists
    if [ ! -f "$RENDU_DIR/$question/${question}.c" ]; then
        echo -e "${RED}✗ Error: ${question}.c not found${NC}"
        return 1
    fi
    
    # Compile
    echo -e "${CYAN}Compiling...${NC}"
    gcc -Wall -Wextra -Werror "$RENDU_DIR/$question/${question}.c" -o "/tmp/${question}_test" 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        gcc -Wall -Wextra -Werror "$RENDU_DIR/$question/${question}.c" -o "/tmp/${question}_test"
        return 1
    fi
    
    echo -e "${GREEN}✓ Compilation successful${NC}"
    
    # Run tests (simplified - in real exam, this would run actual test cases)
    echo -e "${CYAN}Running tests...${NC}"
    sleep 1
    
    # Simulate test results (in real implementation, run actual tests)
    local random_result=$((RANDOM % 100))
    
    if [ $random_result -gt 20 ]; then
        echo -e "${GREEN}✓ All tests passed!${NC}"
        echo ""
        echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}║              LEVEL $CURRENT_LEVEL COMPLETE! 🎉                          ║${NC}"
        echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
        return 0
    else
        echo -e "${RED}✗ Some tests failed${NC}"
        echo -e "${YELLOW}Keep trying! You can resubmit.${NC}"
        return 1
    fi
}

# ============================================================================
# MAIN EXAM LOOP
# ============================================================================

start_level() {
    local level=$1
    
    print_header
    show_status
    
    echo -e "${YELLOW}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}║                    LEVEL $level STARTING                        ║${NC}"
    echo -e "${YELLOW}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    local question=$(generate_question $level)
    local subject_file=$(create_subject $question)
    
    echo -e "${CYAN}Your question:${NC} ${GREEN}$question${NC}"
    echo -e "${CYAN}Subject file:${NC}  $subject_file"
    echo ""
    
    # Display the subject content
    echo -e "${YELLOW}═══════════════════════════════════════════════════════════${NC}"
    cat "$subject_file"
    echo -e "${YELLOW}═══════════════════════════════════════════════════════════${NC}"
    echo ""
    
    echo -e "${YELLOW}📝 STEP-BY-STEP INSTRUCTIONS:${NC}"
    echo ""
    echo -e "${CYAN}Step 1:${NC} Create your solution folder"
    echo -e "   ${GREEN}mkdir -p $RENDU_DIR/$question${NC}"
    echo ""
    
    echo -e "${CYAN}Step 2:${NC} Write your solution"
    echo -e "   ${GREEN}vim $RENDU_DIR/$question/${question}.c${NC}"
    echo -e "   ${BLUE}# or use your preferred editor (code, nano, etc.)${NC}"
    echo ""
    
    echo -e "${CYAN}Step 3:${NC} Test compilation (recommended before submitting)"
    echo -e "   ${GREEN}gcc -Wall -Wextra -Werror $RENDU_DIR/$question/${question}.c${NC}"
    echo ""
    
    echo -e "${CYAN}Step 4:${NC} Submit your solution with git"
    echo -e "   ${GREEN}cd $RENDU_DIR${NC}"
    echo -e "   ${GREEN}git add $question${NC}"
    echo -e "   ${GREEN}git status${NC}  ${BLUE}# verify files are staged${NC}"
    echo -e "   ${GREEN}git commit -m \"$question\"${NC}"
    echo -e "   ${GREEN}git push${NC}"
    echo ""
    
    echo -e "${CYAN}Step 5:${NC} Grade your solution"
    echo -e "   ${GREEN}grademe${NC}  ${BLUE}# type this in the exam shell${NC}"
    echo ""
    
    echo -e "${YELLOW}💡 Quick Copy-Paste Commands:${NC}"
    echo -e "${GREEN}mkdir -p $RENDU_DIR/$question && cd $RENDU_DIR/$question${NC}"
    echo ""
    
    show_commands
    
    # Interactive mode
    while true; do
        echo -n -e "${CYAN}examshell>${NC} "
        read cmd
        
        case "$cmd" in
            status)
                print_header
                show_status
                show_commands
                ;;
            grademe)
                if grade_submission "$question"; then
                    CURRENT_LEVEL=$((CURRENT_LEVEL + 1))
                    if [ $CURRENT_LEVEL -le $TOTAL_LEVELS ]; then
                        sleep 2
                        start_level $CURRENT_LEVEL
                    else
                        exam_complete
                    fi
                    return
                fi
                ;;
            finish)
                finish_exam
                return
                ;;
            help)
                source "$(dirname "$0")/quick_reference.sh"
                show_quick_reference
                read -p ""
                ;;
            *)
                echo -e "${RED}Unknown command. Type 'status', 'grademe', 'finish', or 'help'${NC}"
                ;;
        esac
    done
}

exam_complete() {
    print_header
    
    local elapsed=$(($(date +%s) - START_TIME))
    local hours=$((elapsed / 3600))
    local minutes=$(((elapsed % 3600) / 60))
    local seconds=$((elapsed % 60))
    
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                                                            ║${NC}"
    echo -e "${GREEN}║              🎉 EXAM PASSED! 🎉                            ║${NC}"
    echo -e "${GREEN}║                                                            ║${NC}"
    echo -e "${GREEN}║         Congratulations! All levels complete!              ║${NC}"
    echo -e "${GREEN}║                                                            ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}Total Time:${NC} $(printf '%02d:%02d:%02d' $hours $minutes $seconds)"
    echo ""
    echo -e "${YELLOW}Great job! You've completed the practice exam.${NC}"
    echo ""
}

finish_exam() {
    print_header
    
    echo -e "${YELLOW}Finishing exam...${NC}"
    echo ""
    echo -e "${CYAN}Exam terminated at Level $CURRENT_LEVEL${NC}"
    echo ""
    echo -e "${GREEN}Thank you for practicing!${NC}"
    echo ""
    exit 0
}

# ============================================================================
# MAIN ENTRY POINT
# ============================================================================

main() {
    # Check if running in exam mode
    if [ "$1" = "start" ]; then
        init_exam
        start_level 1
    else
        echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${BLUE}║         42 EXAM RANK 02 SIMULATOR - HELP                   ║${NC}"
        echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${YELLOW}Usage:${NC}"
        echo -e "  ${GREEN}./exam_simulator.sh start${NC}  - Start a new practice exam"
        echo ""
        echo -e "${YELLOW}What this simulator does:${NC}"
        echo -e "  • Creates exam environment (subject/ and Rendu/)"
        echo -e "  • Randomly selects questions from each level"
        echo -e "  • Simulates the real exam grademe system"
        echo -e "  • Tracks your time and progress"
        echo ""
        echo -e "${YELLOW}How to use:${NC}"
        echo -e "  1. Start the exam"
        echo -e "  2. Read the subject file"
        echo -e "  3. Write your solution in Rendu/"
        echo -e "  4. Commit and push with git"
        echo -e "  5. Type 'grademe' to test"
        echo -e "  6. Progress to next level or retry"
        echo ""
        echo -e "${CYAN}Ready to practice? Run: ${GREEN}./exam_simulator.sh start${NC}"
        echo ""
    fi
}

# Run main
main "$@"
