
package cpu_tb_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import axi4_globals_pkg::*;
  import axi4_slave_pkg::*;

  `include "slave_seq/axi4_slave_base_seq.sv"
  `include "slave_seq/axi4_slave_write_seq.sv"
  `include "slave_seq/axi4_slave_read_seq.sv"

  `include "cpu_agent/cpu_tx.sv"
  `include "cpu_agent/cpu_sequencer.sv"
  `include "cpu_agent/cpu_driver.sv"
  `include "cpu_agent/cpu_monitor.sv"
  `include "cpu_agent/cpu_agent.sv"
  `include "cpu_agent/cpu_write_seq.sv"
  `include "cpu_agent/cpu_read_seq.sv"   // ADDED: cpu-side read sequence

  `include "env/cpu_scoreboard.sv"
  `include "env/cpu_env.sv"
  `include "env/axi_vip_env.sv"

  `include "vseq/top_vseq.sv"
  // ADDED: the 2 virtual sequences that run the cpu sequence and the AXI4
  // slave sequence together (see each file's header comment for why).
  `include "vseq/axi4_virtual_write_seq.sv"
  `include "vseq/axi4_virtual_read_seq.sv"
  `include "vseq/axi4_virtual_write_read_seq.sv"


  `include "env/top_env.sv"
  `include "test/base_test.sv"
  `include "test/single_seq_test.sv"
  // ADDED: the 2 requested virtual testcases.
  `include "test/axi4_virtual_write_test.sv"
  `include "test/axi4_virtual_read_test.sv"
  `include "test/axi4_virtual_write_read_test.sv"

endpackage : cpu_tb_pkg
