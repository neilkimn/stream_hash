// This is a generated file. Use and modify at your own risk.
//////////////////////////////////////////////////////////////////////////////// 
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
module finn_rtl_krnl_example #(
  parameter integer C_AXIS00_TDATA_WIDTH = 512,
  parameter integer C_AXIS01_TDATA_WIDTH = 512
)
(
  // System Signals
  input  wire                              ap_clk       ,
  input  wire                              ap_rst_n     ,
  // Pipe (AXI4-Stream host) interface axis00
  output wire                              axis00_tvalid,
  input  wire                              axis00_tready,
  output wire [C_AXIS00_TDATA_WIDTH-1:0]   axis00_tdata ,
  output wire [C_AXIS00_TDATA_WIDTH/8-1:0] axis00_tkeep ,
  output wire                              axis00_tlast ,
  // Pipe (AXI4-Stream host) interface axis01
  input  wire                              axis01_tvalid,
  output wire                              axis01_tready,
  input  wire [C_AXIS01_TDATA_WIDTH-1:0]   axis01_tdata ,
  input  wire [C_AXIS01_TDATA_WIDTH/8-1:0] axis01_tkeep ,
  input  wire                              axis01_tlast 
);


timeunit 1ps;
timeprecision 1ps;

///////////////////////////////////////////////////////////////////////////////
// Local Parameters
///////////////////////////////////////////////////////////////////////////////
// Large enough for interesting traffic.
localparam integer  LP_DEFAULT_LENGTH_IN_BYTES = 16384;
localparam integer  LP_NUM_EXAMPLES    = 1;

///////////////////////////////////////////////////////////////////////////////
// Wires and Variables
///////////////////////////////////////////////////////////////////////////////
(* KEEP = "yes" *)
logic                                areset                         = 1'b0;
logic [32-1:0]                       ctrl_xfer_size_in_bytes        = LP_DEFAULT_LENGTH_IN_BYTES;
logic [32-1:0]                       ctrl_constant                  = 32'd1;

///////////////////////////////////////////////////////////////////////////////
// Begin RTL
///////////////////////////////////////////////////////////////////////////////

// Register and invert reset signal.
always @(posedge ap_clk) begin
  areset <= ~ap_rst_n;
end

// Vadd stream example
finn_rtl_krnl_example_vadd_axis #(
  .C_S_AXIS_TDATA_WIDTH ( C_AXIS00_TDATA_WIDTH       ),
  .C_M_AXIS_TDATA_WIDTH ( C_AXIS00_TDATA_WIDTH       ),
  .C_ADDER_BIT_WIDTH    ( 32                         ),
  .C_NUM_CLOCKS         ( 1                          ),
  .C_GEN_S_AXIS_DATA    ( 0                          ),
  .C_LENGTH_IN_BYTES    ( LP_DEFAULT_LENGTH_IN_BYTES )
)
inst_example_vadd__axis01_to_axis00 (
  .aclk          ( ap_clk        ),
  .areset        ( areset        ),
  .kernel_clk    ( ap_clk        ),
  .kernel_rst    ( areset        ),
  .s_axis_tvalid ( axis01_tvalid ),
  .s_axis_tready ( axis01_tready ),
  .s_axis_tdata  ( axis01_tdata  ),
  .s_axis_tkeep  ( axis01_tkeep  ),
  .s_axis_tlast  ( axis01_tlast  ),
  .m_axis_tvalid ( axis00_tvalid ),
  .m_axis_tready ( axis00_tready ),
  .m_axis_tdata  ( axis00_tdata  ),
  .m_axis_tkeep  ( axis00_tkeep  ),
  .m_axis_tlast  ( axis00_tlast  ),
  .ctrl_constant ( 32'b1         )
);

endmodule : finn_rtl_krnl_example
`default_nettype wire
