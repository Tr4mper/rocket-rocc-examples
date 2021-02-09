#include "riscv_test.h"
#include "riscv-tests/isa/macros/scalar/test_macros.h"
#include "include/accumulator.h"
#include "rocc-software/src/riscv_test_rocc.h"

#define CUSTOM_X 0

  RVTEST_WITH_ROCC

start:

  RVTEST_CODE_BEGIN

  // TEST ADD
  li a0, 5
  li a1, 7
  ROCC_INSTRUCTION_RAW_R_R_R(CUSTOM_X, a0, a0, a1, 0)
  TEST_CASE(1, a0, 12, )

  // TEST SUB
  li a0, 12
  li a1, 5
  ROCC_INSTRUCTION_RAW_R_R_R(CUSTOM_X, a0, a0, a1, 1)
  TEST_CASE(2, a0, 7, )

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
