-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity write_stream_512_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    acc_data_V_read : IN STD_LOGIC_VECTOR (511 downto 0);
    acc_keep_V_read : IN STD_LOGIC_VECTOR (63 downto 0);
    acc_last_V_read : IN STD_LOGIC_VECTOR (0 downto 0);
    axis00_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
    axis00_TVALID : OUT STD_LOGIC;
    axis00_TREADY : IN STD_LOGIC;
    axis00_TKEEP : OUT STD_LOGIC_VECTOR (63 downto 0);
    axis00_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    axis00_TDATA_blk_n : OUT STD_LOGIC;
    ap_ce : IN STD_LOGIC );
end;


architecture behav of write_stream_512_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, axis00_TREADY, ap_ce)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, axis00_TREADY, ap_ce)
    begin
        if ((((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or (not(((ap_start = ap_const_logic_0) or (axis00_TREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_state1, axis00_TREADY, ap_ce)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (axis00_TREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    axis00_TDATA <= acc_data_V_read;

    axis00_TDATA_blk_n_assign_proc : process(ap_start, ap_CS_fsm_state1, axis00_TREADY)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            axis00_TDATA_blk_n <= axis00_TREADY;
        else 
            axis00_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    axis00_TKEEP <= acc_keep_V_read;
    axis00_TLAST <= acc_last_V_read;

    axis00_TVALID_assign_proc : process(ap_start, ap_CS_fsm_state1, axis00_TREADY, ap_ce)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (axis00_TREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_ce) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            axis00_TVALID <= ap_const_logic_1;
        else 
            axis00_TVALID <= ap_const_logic_0;
        end if; 
    end process;

end behav;
