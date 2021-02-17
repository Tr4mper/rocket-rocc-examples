#include "riscv_test.h"
#include "riscv-tests/isa/macros/scalar/test_macros.h"
#include "include/accumulator.h"
#include "rocc-software/src/riscv_test_rocc.h"

#define CUSTOM_X 0

  RVTEST_WITH_ROCC

start:

  RVTEST_CODE_BEGIN

  // TEST STORE 1
  li a0, 5
  li a1, 0
  ROCC_INSTRUCTION_RAW_R_R_R(CUSTOM_X, a0, a0, a1, 0)
  TEST_CASE(1, a0, 0, )

  // TEST STORE 2
  li a0, 7
  li a1, 8
  ROCC_INSTRUCTION_RAW_R_R_R(CUSTOM_X, a0, a0, a1, 0)
  TEST_CASE(2, a0, 0, )

  // TEST LOAD 1
  li a0, 0
  li a1, 0
  ROCC_INSTRUCTION_RAW_R_R_R(CUSTOM_X, a0, a0, a1, 1)
  TEST_CASE(3, a0, 5, )

  // TEST LOAD 2
  li a0, 0
  li a1, 8
  ROCC_INSTRUCTION_RAW_R_R_R(CUSTOM_X, a0, a0, a1, 1)
  TEST_CASE(4, a0, 7, )

  TEST_PASSFAIL

  RVTEST_CODE_END

  .data
  RVTEST_DATA_BEGIN

  TEST_DATA
data:
  .dword 0xdead
  .dword 0xbeef
  .dword 0x0bad
  .dword 0xf00d

  RVTEST_DATA_END
