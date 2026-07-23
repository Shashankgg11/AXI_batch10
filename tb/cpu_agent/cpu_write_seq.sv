class cpu_write_seq extends uvm_sequence #(cpu_tx);

  `uvm_object_utils(cpu_write_seq)

  cpu_tx req;

  function new(string name="cpu_write_seq");
    super.new(name);
  endfunction

  task body();

    req = cpu_tx::type_id::create("req");

    start_item(req);

    assert(req.randomize() with {
      pkt_type == WRITE_PKT;
      strobe != 0;
    });

    finish_item(req);

  endtask

endclass
