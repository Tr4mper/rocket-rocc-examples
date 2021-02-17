#include "riscv_test.h"
#include "riscv-tests/isa/macros/scalar/test_macros.h"
#include "include/accumulator.h"
#include "rocc-software/src/riscv_test_rocc.h"

#define ARITHMETIC 0
#define MEMORY 1
#define REGISTER 2

  RVTEST_WITH_ROCC

start:

  RVTEST_CODE_BEGIN

  // TEST STORE 1
  li a0, 5
  ROCC_INSTRUCTION_RAW_R_R_R(REGISTER, a0, a0, x0, 0)
  TEST_CASE(1, a0, 5, )

  // TEST LOAD
  li a0, 17
  ROCC_INSTRUCTION_RAW_R_R_R(REGISTER, a0, x0, x0, 1)
  TEST_CASE(2, a0, 5, )

  // TEST STORE 2
  li a0, 7
  ROCC_INSTRUCTION_RAW_R_R_R(REGISTER, a0, a0, x0, 0)
  TEST_CASE(3, a0, 7, )

  // TEST LOAD
  li a0, 17
  ROCC_INSTRUCTION_RAW_R_R_R(REGISTER, a0, x0, x0, 1)
  TEST_CASE(4, a0, 7, )

  // TEST LOAD
  li a0, 17
  ROCC_INSTRUCTION_RAW_R_R_R(REGISTER, a0, x0, x0, 1)
  TEST_CASE(5, a0, 7, )




  // TEST STORE MEMORY 1
  li a0, 5
  li a1, 0
  ROCC_INSTRUCTION_RAW_R_R_R(MEMORY, a0, a0, a1, 0)
  TEST_CASE(6, a0, 0, )

  // TEST STORE MEMORY 2
  li a0, 27
  li a1, 1
  ROCC_INSTRUCTION_RAW_R_R_R(MEMORY, a0, a0, a1, 0)
  TEST_CASE(7, a0, 0, )

  // TEST LOAD 1
  li a0, 0
  li a1, 0
  ROCC_INSTRUCTION_RAW_R_R_R(MEMORY, a0, a0, a1, 1)
  TEST_CASE(8, a0, 5, )

  // TEST LOAD 2
  li a0, 0
  li a1, 1
  ROCC_INSTRUCTION_RAW_R_R_R(MEMORY, a0, a0, a1, 1)
  TEST_CASE(9, a0, 27, )





  // TEST ADD
  li a0, 5
  li a1, 7
  ROCC_INSTRUCTION_RAW_R_R_R(ARITHMETIC, a0, a0, a1, 0)
  TEST_CASE(10, a0, 12, )

  // TEST SUB
  li a0, 7
  li a1, 5
  ROCC_INSTRUCTION_RAW_R_R_R(ARITHMETIC, a0, a0, a1, 1)
  TEST_CASE(11, a0, 2, )


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
