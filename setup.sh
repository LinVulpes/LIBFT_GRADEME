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

# Make scripts executable
echo -e "${YELLOW}Setting up exam practice environment...${NC}"
chmod +x exam_simulator.sh
chmod +x exam_grader.sh

echo -e "${GREEN}✓${NC} Scripts are now executable"
echo ""

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
