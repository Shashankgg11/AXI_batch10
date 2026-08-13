`ifndef AXI4_SLAVE_BASE_SEQ_INCLUDED_
`define AXI4_SLAVE_BASE_SEQ_INCLUDED_

class axi4_slave_base_seq extends uvm_sequence #(axi4_slave_tx);
 

  `uvm_object_utils(axi4_slave_base_seq)


  extern function new(string name = "axi4_slave_base_seq");
endclass : axi4_slave_base_seq

function axi4_slave_base_seq::new(string name = "axi4_slave_base_seq");
  super.new(name);
endfunction : new

`endif
