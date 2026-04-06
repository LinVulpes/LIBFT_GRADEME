#!/bin/bash

# ============================================================================
# 42 EXAM PRACTICE - QUICK SETUP
# ============================================================================

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     42 EXAM RANK 02 PRACTICE - SETUP                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo -e "${YELLOW}Setting up exam practice environment...${NC}"
echo ""

# Check if required files exist
REQUIRED_FILES=("exam_simulator.sh" "exam_grader.sh" "subjects.sh" "quick_reference.sh")
MISSING_FILES=()

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} Found: $file"
        chmod +x "$file"
    else
        echo -e "${RED}✗${NC} Missing: $file"
        MISSING_FILES+=("$file")
    fi
done

echo ""

if [ ${#MISSING_FILES[@]} -eq 0 ]; then
    echo -e "${GREEN}✓${NC} All required files present"
    echo -e "${GREEN}✓${NC} Scripts are now executable"
    echo ""
else
    echo -e "${RED}⚠ Warning: Missing ${#MISSING_FILES[@]} file(s)${NC}"
    echo -e "${YELLOW}Missing files:${NC}"
    for file in "${MISSING_FILES[@]}"; do
        echo -e "  - $file"
    done
    echo ""
    echo -e "${YELLOW}Please make sure all files are in the same directory.${NC}"
    echo ""
fi

# Create alias suggestion
echo -e "${CYAN}Setup complete!${NC}"
echo ""
echo -e "${YELLOW}Quick Start Commands:${NC}"
echo -e "  ${GREEN}./exam_simulator.sh start${NC}  - Start a practice exam"
echo -e "  ${GREEN}./exam_grader.sh${NC}           - View grader help"
echo ""

echo -e "${YELLOW}Optional: Add to your ~/.bashrc or ~/.zshrc:${NC}"
echo -e "${CYAN}alias exam-practice='cd $(pwd) && ./exam_simulator.sh start'${NC}"
echo ""

echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Ready to practice! Run: ${YELLOW}./exam_simulator.sh start${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════════${NC}"
echo ""