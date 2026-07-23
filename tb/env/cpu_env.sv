class env extends uvm_env;

  `uvm_component_utils(env)

  cpu_agent cpu_agt_h;
  //cpu_subscriber cpu_sub_h;

  scoreboard sb_h;

  cpu_sequencer seqr_h;

  function new(string name = "env", uvm_component parent = null);
    super.new(name,parent);
  endfunction


  function void build_phase(uvm_phase phase);

    super.build_phase(phase);
    cpu_agt_h = cpu_agent::type_id::create("cpu_agt_h", this);
    //cpu_sub_h = cpu_subscriber::type_id::create("cpu_sub_h", this);
    sb_h = scoreboard::type_id::create("sb_h", this);
    seqr_h = sequencer::type_id::create("seqr_h", this);

  endfunction


  function void connect_phase(uvm_phase phase);

    super.connect_phase(phase);

    cpu_agt_h.cpu_mon_h.mon_ap.connect(cpu_sub_h.analysis_export);

    //cpu_agt_h.cpu_mon_h.mon_ap.connect(sb_h.cpu_fifo.analysis_export);

  endfunction

endclass
