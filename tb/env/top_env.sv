class top_env extends uvm_env;

  `uvm_component_utils(top_env)

  cpu_env      cpu_env_h;
  axi_vip_env  axi_vip_env_h;
  top_vseqr    vseqr_h;

  function new(string name = "top_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cpu_env_h     = cpu_env::type_id::create("cpu_env_h", this);
    axi_vip_env_h = axi_vip_env::type_id::create("axi_vip_env_h", this);
    vseqr_h       = top_vseqr::type_id::create("vseqr_h", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vseqr_h.cpu_sqr_h         = cpu_env_h.cpu_agt_h.cpu_seqr_h;
    vseqr_h.slave_write_sqr_h = axi_vip_env_h.slave_agt_h.axi4_slave_write_seqr_h;
    vseqr_h.slave_read_sqr_h  = axi_vip_env_h.slave_agt_h.axi4_slave_read_seqr_h;

    axi_vip_env_h.slave_agt_h.axi4_slave_mon_proxy_h.axi4_slave_write_data_analysis_port.connect(cpu_env_h.sb_h.axi_wr);

    axi_vip_env_h.slave_agt_h.axi4_slave_mon_proxy_h.axi4_slave_write_address_analysis_port.connect(cpu_env_h.sb_h.axi_waddr);
    axi_vip_env_h.slave_agt_h.axi4_slave_mon_proxy_h.axi4_slave_write_response_analysis_port.connect(cpu_env_h.sb_h.axi_wresp);
    axi_vip_env_h.slave_agt_h.axi4_slave_mon_proxy_h.axi4_slave_read_address_analysis_port.connect(cpu_env_h.sb_h.axi_raddr);
    axi_vip_env_h.slave_agt_h.axi4_slave_mon_proxy_h.axi4_slave_read_data_analysis_port.connect(cpu_env_h.sb_h.axi_rdata);
  endfunction

endclass
