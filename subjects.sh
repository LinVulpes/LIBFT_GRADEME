#!/bin/bash

# ============================================================================
# SUBJECT GENERATOR - Creates detailed subject files for exam questions
# ============================================================================

create_subject_ft_strlen() {
    cat << 'EOF'
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
EOF
}

create_subject_ft_strcpy() {
    cat << 'EOF'
Assignment name  : ft_strcpy
Expected files   : ft_strcpy.c
Allowed functions: None
--------------------------------------------------------------------------------

Reproduce the behavior of the function strcpy (man strcpy).

Your function must be declared as follows:

char    *ft_strcpy(char *s1, char *s2);
EOF
}

create_subject_ft_putstr() {
    cat << 'EOF'
Assignment name  : ft_putstr
Expected files   : ft_putstr.c
Allowed functions: write
--------------------------------------------------------------------------------

Write a function that displays a string on the standard output.

The pointer passed to the function contains the address of the string's first
character.

Your function must be declared as follows:

void	ft_putstr(char *str);
EOF
}

create_subject_ft_swap() {
    cat << 'EOF'
Assignment name  : ft_swap
Expected files   : ft_swap.c
Allowed functions: None
--------------------------------------------------------------------------------

Write a function that swaps the contents of two integers the addresses of which
are passed as parameters.

Your function must be declared as follows:

void	ft_swap(int *a, int *b);

Example:
    int a = 1;
    int b = 2;
    ft_swap(&a, &b);
    // a = 2, b = 1
EOF
}

create_subject_fizzbuzz() {
    cat << 'EOF'
Assignment name  : fizzbuzz
Expected files   : fizzbuzz.c
Allowed functions: write
--------------------------------------------------------------------------------

Write a program that prints the numbers from 1 to 100, each separated by a
newline.

If the number is a multiple of 3, it prints 'fizz' instead.
If the number is a multiple of 5, it prints 'buzz' instead.
If the number is both a multiple of 3 and a multiple of 5, it prints 'fizzbuzz'.

Example:
$>./fizzbuzz
1
2
fizz
4
buzz
fizz
7
8
fizz
buzz
11
fizz
13
14
fizzbuzz
[...]
97
98
fizz
buzz
$>
EOF
}

create_subject_ft_atoi() {
    cat << 'EOF'
Assignment name  : ft_atoi
Expected files   : ft_atoi.c
Allowed functions: None
--------------------------------------------------------------------------------

Write a function that converts the string argument str to an integer (type int)
and returns it.

It works much like the standard atoi(const char *str) function, see the man.

Your function must be declared as follows:

int	ft_atoi(const char *str);
EOF
}

create_subject_ft_strcmp() {
    cat << 'EOF'
Assignment name  : ft_strcmp
Expected files   : ft_strcmp.c
Allowed functions: None
--------------------------------------------------------------------------------

Reproduce the behavior of the function strcmp (man strcmp).

Your function must be declared as follows:

int    ft_strcmp(char *s1, char *s2);
EOF
}

create_subject_ft_strdup() {
    cat << 'EOF'
Assignment name  : ft_strdup
Expected files   : ft_strdup.c
Allowed functions: malloc
--------------------------------------------------------------------------------

Reproduce the behavior of the function strdup (man strdup).

Your function must be declared as follows:

char    *ft_strdup(char *src);
EOF
}

create_subject_inter() {
    cat << 'EOF'
Assignment name  : inter
Expected files   : inter.c
Allowed functions: write
--------------------------------------------------------------------------------

Write a program that takes two strings and displays, without doubles, the
characters that appear in both strings, in the order they appear in the first
one.

The display will be followed by a \n.

If the number of arguments is not 2, the program displays \n.

Examples:

$>./inter "padinton" "paqefwtdjetyiytjneytjoeyjnejeyj" | cat -e
padinto$
$>./inter ddf6vewg64f gtwthgdwthdwfteewhrtag6h4ffdhsd | cat -e
df6ewg4$
$>./inter "rien" "cette phrase ne cache rien" | cat -e
rien$
$>./inter | cat -e
$
EOF
}

create_subject_ft_atoi_base() {
    cat << 'EOF'
Assignment name  : ft_atoi_base
Expected files   : ft_atoi_base.c
Allowed functions: None
--------------------------------------------------------------------------------

Write a function that converts the string argument str (base N <= 16)
to an integer (base 10) and returns it.

The characters recognized in the input are: 0123456789abcdef
Those are, of course, to be trimmed according to the requested base. For
example, base 4 recognizes "0123" and base 16 recognizes "0123456789abcdef".

Uppercase letters must also be recognized: "12fdb3" is the same as "12FDB3".

Minus signs ('-') are interpreted only if they are the first character of the
string.

Your function must be declared as follows:

int	ft_atoi_base(const char *str, int str_base);
EOF
}

create_subject_ft_itoa() {
    cat << 'EOF'
Assignment name  : ft_itoa
Expected files   : ft_itoa.c
Allowed functions: malloc
--------------------------------------------------------------------------------

Write a function that takes an int and converts it to a null-terminated string.
The function returns the result in a char array that you must allocate.

Your function must be declared as follows:

char	*ft_itoa(int nbr);
EOF
}

create_subject_ft_split() {
    cat << 'EOF'
Assignment name  : ft_split
Expected files   : ft_split.c
Allowed functions: malloc
--------------------------------------------------------------------------------

Write a function that takes a string, splits it into words, and returns them as
a NULL-terminated array of strings.

A "word" is defined as a part of a string delimited either by spaces/tabs/new
lines, or by the start/end of the string.

Your function must be declared as follows:

char    **ft_split(char *str);
EOF
}

# Function to get subject content
get_subject() {
    local question=$1
    
    case "$question" in
        ft_strlen)      create_subject_ft_strlen ;;
        ft_strcpy)      create_subject_ft_strcpy ;;
        ft_putstr)      create_subject_ft_putstr ;;
        ft_swap)        create_subject_ft_swap ;;
        fizzbuzz)       create_subject_fizzbuzz ;;
        ft_atoi)        create_subject_ft_atoi ;;
        ft_strcmp)      create_subject_ft_strcmp ;;
        ft_strdup)      create_subject_ft_strdup ;;
        inter)          create_subject_inter ;;
        ft_atoi_base)   create_subject_ft_atoi_base ;;
        ft_itoa)        create_subject_ft_itoa ;;
        ft_split)       create_subject_ft_split ;;
        *)
            echo "Assignment name  : $question"
            echo "Expected files   : ${question}.c"
            echo "Allowed functions: (see man page)"
            echo "--------------------------------------------------------------------------------"
            echo ""
            echo "Write the function $question."
            echo "Check the exam subject database for full description."
            ;;
    esac
}

# Export function for use by other scripts
if [ "$1" != "" ]; then
    get_subject "$1"
fi
