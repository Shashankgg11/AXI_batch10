class axi_vip_env extends uvm_env;

  `uvm_component_utils(axi_vip_env)

  axi4_slave_agent slave_agt_h;

  function new(string name = "axi_vip_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    slave_agt_h = axi4_slave_agent::type_id::create("slave_agt_h", this);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    slave_agt_h.axi4_slave_agent_cfg_h.slave_id           = 0;
    slave_agt_h.axi4_slave_agent_cfg_h.min_address         = 0;
    slave_agt_h.axi4_slave_agent_cfg_h.max_address         = 2**(SLAVE_MEMORY_SIZE) - 1;
    slave_agt_h.axi4_slave_agent_cfg_h.slave_response_mode = RESP_IN_ORDER;
    //slave_agt_h.axi4_slave_agent_cfg_h.read_data_mode      = RANDOM_DATA_MODE;
  endfunction

endclass
