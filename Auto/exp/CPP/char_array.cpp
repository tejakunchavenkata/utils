#include <iostream>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#define GPR_BASE_REGS 
const char *reg_names[GPR_BASE_REGS] = {
  "r0",   "r1",   "r2",   "r3",   "r4",   "r5",     "r6",     "r7",
  "r8",   "r9",   "r10",  "r11",  "r12",  "r13",    "r14",    "r15",
  "r16",  "r17",  "r18",  "r19",  "r20",  "r21",    "r22",    "r23",
  "r24",  "r25",  "gp",   "fp",   "sp",   "ilink1", "ilink2", "blink",
  "r32",  "r33",  "r34",  "r35",  "r36",  "r37",    "r38",    "r39",
  "r40",  "r41",  "r42",  "r43",  "r44",  "r45",    "r46",    "r47",
  "r48",  "r49",  "r50",  "r51",  "r52",  "r53",    "r54",    "r55",
  "r56",  "mlo",  "mmid", "mhi",  "r60",  "r61",    "limm",   "pcl"
};
int main () {
        for (int j=0; j<64 ; j++) {
                printf ("%s\n", reg_names[j]) ;
        }
        return 0 ;
}
