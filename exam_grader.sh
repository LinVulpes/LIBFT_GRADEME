#!/bin/bash

# ============================================================================
# 42 EXAM RANK 02 - AUTOMATED GRADER
# ============================================================================
# This script contains actual test cases for each exam function
# ============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

PASSED=0
FAILED=0
TOTAL=0

# Test wrapper
run_test() {
    local test_name=$1
    local expected=$2
    local actual=$3
    
    TOTAL=$((TOTAL + 1))
    
    if [ "$expected" = "$actual" ]; then
        echo -e "${GREEN}✓${NC} $test_name"
        PASSED=$((PASSED + 1))
    else
        echo -e "${RED}✗${NC} $test_name"
        echo -e "   Expected: $expected"
        echo -e "   Got:      $actual"
        FAILED=$((FAILED + 1))
    fi
}

# ============================================================================
# LEVEL 1 TESTS
# ============================================================================

test_ft_strlen() {
    echo -e "${YELLOW}Testing ft_strlen...${NC}"
    
    # Compile test
    cat > /tmp/test_ft_strlen.c << 'EOF'
#include <stdio.h>
size_t ft_strlen(const char *s);

int main(void) {
    printf("%zu\n", ft_strlen("hello"));
    printf("%zu\n", ft_strlen(""));
    printf("%zu\n", ft_strlen("42"));
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_strlen.c "$1/ft_strlen.c" -o /tmp/ft_strlen_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_strlen_test)
    run_test "ft_strlen(\"hello\")" "5" "$(echo "$output" | sed -n '1p')"
    run_test "ft_strlen(\"\")" "0" "$(echo "$output" | sed -n '2p')"
    run_test "ft_strlen(\"42\")" "2" "$(echo "$output" | sed -n '3p')"
}

test_ft_strcpy() {
    echo -e "${YELLOW}Testing ft_strcpy...${NC}"
    
    cat > /tmp/test_ft_strcpy.c << 'EOF'
#include <stdio.h>
char *ft_strcpy(char *dst, const char *src);

int main(void) {
    char dst[50];
    ft_strcpy(dst, "hello");
    printf("%s\n", dst);
    ft_strcpy(dst, "");
    printf("%s\n", dst);
    ft_strcpy(dst, "42 Network");
    printf("%s\n", dst);
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_strcpy.c "$1/ft_strcpy.c" -o /tmp/ft_strcpy_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_strcpy_test)
    run_test "ft_strcpy basic" "hello" "$(echo "$output" | sed -n '1p')"
    run_test "ft_strcpy empty" "" "$(echo "$output" | sed -n '2p')"
    run_test "ft_strcpy spaces" "42 Network" "$(echo "$output" | sed -n '3p')"
}

test_ft_putstr() {
    echo -e "${YELLOW}Testing ft_putstr...${NC}"
    
    cat > /tmp/test_ft_putstr.c << 'EOF'
#include <unistd.h>
void ft_putstr(char *str);

int main(void) {
    ft_putstr("hello");
    write(1, "\n", 1);
    ft_putstr("42");
    write(1, "\n", 1);
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_putstr.c "$1/ft_putstr.c" -o /tmp/ft_putstr_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_putstr_test)
    run_test "ft_putstr \"hello\"" "hello" "$(echo "$output" | sed -n '1p')"
    run_test "ft_putstr \"42\"" "42" "$(echo "$output" | sed -n '2p')"
}

# ============================================================================
# LEVEL 2 TESTS
# ============================================================================

test_ft_atoi() {
    echo -e "${YELLOW}Testing ft_atoi...${NC}"
    
    cat > /tmp/test_ft_atoi.c << 'EOF'
#include <stdio.h>
int ft_atoi(const char *str);

int main(void) {
    printf("%d\n", ft_atoi("42"));
    printf("%d\n", ft_atoi("-42"));
    printf("%d\n", ft_atoi("   123"));
    printf("%d\n", ft_atoi("0"));
    printf("%d\n", ft_atoi("  -456"));
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_atoi.c "$1/ft_atoi.c" -o /tmp/ft_atoi_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_atoi_test)
    run_test "ft_atoi(\"42\")" "42" "$(echo "$output" | sed -n '1p')"
    run_test "ft_atoi(\"-42\")" "-42" "$(echo "$output" | sed -n '2p')"
    run_test "ft_atoi(\"   123\")" "123" "$(echo "$output" | sed -n '3p')"
    run_test "ft_atoi(\"0\")" "0" "$(echo "$output" | sed -n '4p')"
    run_test "ft_atoi(\"  -456\")" "-456" "$(echo "$output" | sed -n '5p')"
}

test_ft_strcmp() {
    echo -e "${YELLOW}Testing ft_strcmp...${NC}"
    
    cat > /tmp/test_ft_strcmp.c << 'EOF'
#include <stdio.h>
int ft_strcmp(char *s1, char *s2);

int main(void) {
    int r1 = ft_strcmp("hello", "hello");
    int r2 = ft_strcmp("hello", "world");
    int r3 = ft_strcmp("world", "hello");
    printf("%d\n", r1 == 0 ? 0 : 1);
    printf("%d\n", r2 < 0 ? -1 : 1);
    printf("%d\n", r3 > 0 ? 1 : -1);
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_strcmp.c "$1/ft_strcmp.c" -o /tmp/ft_strcmp_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_strcmp_test)
    run_test "ft_strcmp equal strings" "0" "$(echo "$output" | sed -n '1p')"
    run_test "ft_strcmp s1 < s2" "-1" "$(echo "$output" | sed -n '2p')"
    run_test "ft_strcmp s1 > s2" "1" "$(echo "$output" | sed -n '3p')"
}

test_ft_strdup() {
    echo -e "${YELLOW}Testing ft_strdup...${NC}"
    
    cat > /tmp/test_ft_strdup.c << 'EOF'
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char *ft_strdup(char *src);

int main(void) {
    char *dup1 = ft_strdup("hello");
    char *dup2 = ft_strdup("");
    char *dup3 = ft_strdup("42");
    
    printf("%s\n", dup1);
    printf("%s\n", dup2);
    printf("%s\n", dup3);
    
    free(dup1);
    free(dup2);
    free(dup3);
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_strdup.c "$1/ft_strdup.c" -o /tmp/ft_strdup_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_strdup_test)
    run_test "ft_strdup(\"hello\")" "hello" "$(echo "$output" | sed -n '1p')"
    run_test "ft_strdup(\"\")" "" "$(echo "$output" | sed -n '2p')"
    run_test "ft_strdup(\"42\")" "42" "$(echo "$output" | sed -n '3p')"
}

# ============================================================================
# LEVEL 3 TESTS
# ============================================================================

test_ft_atoi_base() {
    echo -e "${YELLOW}Testing ft_atoi_base...${NC}"
    
    cat > /tmp/test_ft_atoi_base.c << 'EOF'
#include <stdio.h>
int ft_atoi_base(const char *str, int str_base);

int main(void) {
    printf("%d\n", ft_atoi_base("1010", 2));
    printf("%d\n", ft_atoi_base("2a", 16));
    printf("%d\n", ft_atoi_base("52", 8));
    printf("%d\n", ft_atoi_base("ff", 16));
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_atoi_base.c "$1/ft_atoi_base.c" -o /tmp/ft_atoi_base_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_atoi_base_test)
    run_test "ft_atoi_base(\"1010\", 2)" "10" "$(echo "$output" | sed -n '1p')"
    run_test "ft_atoi_base(\"2a\", 16)" "42" "$(echo "$output" | sed -n '2p')"
    run_test "ft_atoi_base(\"52\", 8)" "42" "$(echo "$output" | sed -n '3p')"
    run_test "ft_atoi_base(\"ff\", 16)" "255" "$(echo "$output" | sed -n '4p')"
}

# ============================================================================
# LEVEL 4 TESTS
# ============================================================================

test_ft_itoa() {
    echo -e "${YELLOW}Testing ft_itoa...${NC}"
    
    cat > /tmp/test_ft_itoa.c << 'EOF'
#include <stdio.h>
#include <stdlib.h>
char *ft_itoa(int nbr);

int main(void) {
    char *s1 = ft_itoa(42);
    char *s2 = ft_itoa(-42);
    char *s3 = ft_itoa(0);
    char *s4 = ft_itoa(123456);
    
    printf("%s\n", s1);
    printf("%s\n", s2);
    printf("%s\n", s3);
    printf("%s\n", s4);
    
    free(s1);
    free(s2);
    free(s3);
    free(s4);
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_itoa.c "$1/ft_itoa.c" -o /tmp/ft_itoa_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_itoa_test)
    run_test "ft_itoa(42)" "42" "$(echo "$output" | sed -n '1p')"
    run_test "ft_itoa(-42)" "-42" "$(echo "$output" | sed -n '2p')"
    run_test "ft_itoa(0)" "0" "$(echo "$output" | sed -n '3p')"
    run_test "ft_itoa(123456)" "123456" "$(echo "$output" | sed -n '4p')"
}

test_ft_split() {
    echo -e "${YELLOW}Testing ft_split...${NC}"
    
    cat > /tmp/test_ft_split.c << 'EOF'
#include <stdio.h>
#include <stdlib.h>
char **ft_split(char *str, char sep);

int main(void) {
    char **result = ft_split("hello world test", ' ');
    int i = 0;
    
    while (result[i]) {
        printf("%s\n", result[i]);
        free(result[i]);
        i++;
    }
    free(result);
    
    return 0;
}
EOF
    
    gcc -Wall -Wextra -Werror /tmp/test_ft_split.c "$1/ft_split.c" -o /tmp/ft_split_test 2>/dev/null
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Compilation failed${NC}"
        return 1
    fi
    
    local output=$(/tmp/ft_split_test)
    run_test "ft_split word 1" "hello" "$(echo "$output" | sed -n '1p')"
    run_test "ft_split word 2" "world" "$(echo "$output" | sed -n '2p')"
    run_test "ft_split word 3" "test" "$(echo "$output" | sed -n '3p')"
}

# ============================================================================
# MAIN GRADER
# ============================================================================

grade_function() {
    local function_name=$1
    local rendu_path=$2
    
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  Grading: ${YELLOW}$function_name${BLUE}                                      ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Check if file exists
    if [ ! -f "$rendu_path/${function_name}.c" ]; then
        echo -e "${RED}✗ Error: ${function_name}.c not found${NC}"
        return 1
    fi
    
    # Run tests based on function name
    case "$function_name" in
        ft_strlen)
            test_ft_strlen "$rendu_path"
            ;;
        ft_strcpy)
            test_ft_strcpy "$rendu_path"
            ;;
        ft_putstr)
            test_ft_putstr "$rendu_path"
            ;;
        ft_atoi)
            test_ft_atoi "$rendu_path"
            ;;
        ft_strcmp)
            test_ft_strcmp "$rendu_path"
            ;;
        ft_strdup)
            test_ft_strdup "$rendu_path"
            ;;
        ft_atoi_base)
            test_ft_atoi_base "$rendu_path"
            ;;
        ft_itoa)
            test_ft_itoa "$rendu_path"
            ;;
        ft_split)
            test_ft_split "$rendu_path"
            ;;
        *)
            echo -e "${YELLOW}No automated tests for $function_name yet${NC}"
            echo -e "${YELLOW}Manual grading required${NC}"
            return 0
            ;;
    esac
    
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo -e "Tests Passed: ${GREEN}$PASSED${NC}/$TOTAL"
    echo -e "Tests Failed: ${RED}$FAILED${NC}/$TOTAL"
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo ""
    
    if [ $FAILED -eq 0 ] && [ $TOTAL -gt 0 ]; then
        echo -e "${GREEN}✓ All tests passed!${NC}"
        return 0
    else
        echo -e "${RED}✗ Some tests failed. Try again!${NC}"
        return 1
    fi
}

# Main entry point
if [ $# -lt 2 ]; then
    echo "Usage: $0 <function_name> <rendu_directory>"
    echo "Example: $0 ft_strlen /path/to/Rendu/ft_strlen"
    exit 1
fi

grade_function "$1" "$2"
