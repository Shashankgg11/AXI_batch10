class axi4_virtual_write_seq extends uvm_sequence;
  `uvm_object_utils(axi4_virtual_write_seq)
  `uvm_declare_p_sequencer(top_vseqr)

  int unsigned num_txns = 1;

  function new(string name = "axi4_virtual_write_seq");
    super.new(name);
  endfunction

  task body();
    cpu_write_seq        cpu_wr_seq;
    axi4_slave_write_seq slv_wr_seq;

fork
  begin
    forever begin
      slv_wr_seq = axi4_slave_write_seq::type_id::create("slv_wr_seq");
      slv_wr_seq.start(p_sequencer.slave_write_sqr_h);
    end
  end
join_none

begin
  cpu_wr_seq = cpu_write_seq::type_id::create("cpu_wr_seq");
  cpu_wr_seq.start(p_sequencer.cpu_sqr_h);
  #5000;
end
wait fork;

  endtask
endclass
