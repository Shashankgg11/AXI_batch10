class cpu_env extends uvm_env;

  `uvm_component_utils(cpu_env)

  cpu_agent      cpu_agt_h;
  cpu_scoreboard sb_h;

  function new(string name = "cpu_env", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cpu_agt_h = cpu_agent::type_id::create("cpu_agt_h", this);
    sb_h      = cpu_scoreboard::type_id::create("sb_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    cpu_agt_h.cpu_mon_h.wr_ap.connect(sb_h.write);
    cpu_agt_h.cpu_mon_h.rd_ap.connect(sb_h.read);
  endfunction

endclass
