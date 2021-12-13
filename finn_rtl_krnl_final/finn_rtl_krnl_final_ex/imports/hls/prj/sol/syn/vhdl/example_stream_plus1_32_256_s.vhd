-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity example_stream_plus1_32_256_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    axis01_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    axis01_TVALID : IN STD_LOGIC;
    axis01_TREADY : OUT STD_LOGIC;
    axis01_TKEEP : IN STD_LOGIC_VECTOR (3 downto 0);
    axis01_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    axis00_TDATA : OUT STD_LOGIC_VECTOR (255 downto 0);
    axis00_TVALID : OUT STD_LOGIC;
    axis00_TREADY : IN STD_LOGIC;
    axis00_TKEEP : OUT STD_LOGIC_VECTOR (31 downto 0);
    axis00_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of example_stream_plus1_32_256_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (10 downto 0) := "00000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (10 downto 0) := "00000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (10 downto 0) := "00000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (10 downto 0) := "00000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (10 downto 0) := "00000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (10 downto 0) := "00001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (10 downto 0) := "00010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (10 downto 0) := "00100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (10 downto 0) := "01000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_lv32_80 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010000000";
    constant ap_const_lv32_9F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010011111";
    constant ap_const_lv32_A0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010100000";
    constant ap_const_lv32_BF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010111111";
    constant ap_const_lv32_C0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011000000";
    constant ap_const_lv32_DF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011011111";
    constant ap_const_lv32_E0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011100000";
    constant ap_const_lv32_FF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011111111";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n : STD_LOGIC;
    signal axis01_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n : STD_LOGIC;
    signal axis00_TDATA_blk_n : STD_LOGIC;
    signal grp_read_stream_32_256_s_fu_70_ap_start : STD_LOGIC;
    signal grp_read_stream_32_256_s_fu_70_ap_done : STD_LOGIC;
    signal grp_read_stream_32_256_s_fu_70_ap_idle : STD_LOGIC;
    signal grp_read_stream_32_256_s_fu_70_ap_ready : STD_LOGIC;
    signal grp_read_stream_32_256_s_fu_70_axis01_TREADY : STD_LOGIC;
    signal grp_read_stream_32_256_s_fu_70_ap_return_0 : STD_LOGIC_VECTOR (255 downto 0);
    signal grp_read_stream_32_256_s_fu_70_ap_return_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_read_stream_32_256_s_fu_70_ap_return_2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_read_stream_32_256_s_fu_70_ap_ce : STD_LOGIC;
    signal ap_block_state10 : BOOLEAN;
    signal call_ln100_write_stream_256_256_s_fu_81_ap_start : STD_LOGIC;
    signal call_ln100_write_stream_256_256_s_fu_81_ap_done : STD_LOGIC;
    signal call_ln100_write_stream_256_256_s_fu_81_ap_idle : STD_LOGIC;
    signal call_ln100_write_stream_256_256_s_fu_81_ap_ready : STD_LOGIC;
    signal call_ln100_write_stream_256_256_s_fu_81_acc_data_V_read : STD_LOGIC_VECTOR (255 downto 0);
    signal call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA : STD_LOGIC_VECTOR (255 downto 0);
    signal call_ln100_write_stream_256_256_s_fu_81_axis00_TVALID : STD_LOGIC;
    signal call_ln100_write_stream_256_256_s_fu_81_axis00_TREADY : STD_LOGIC;
    signal call_ln100_write_stream_256_256_s_fu_81_axis00_TKEEP : STD_LOGIC_VECTOR (31 downto 0);
    signal call_ln100_write_stream_256_256_s_fu_81_axis00_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal call_ln100_write_stream_256_256_s_fu_81_ap_ce : STD_LOGIC;
    signal grp_read_stream_32_256_s_fu_70_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_NS_fsm_state3 : STD_LOGIC;
    signal acc_data_V_fu_234_p9 : STD_LOGIC_VECTOR (255 downto 0);
    signal acc_last_V_fu_107_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal acc_data_V_2_fu_66 : STD_LOGIC_VECTOR (255 downto 0);
    signal trunc_ln647_fu_112_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_4_1_i_fu_122_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_4_2_i_fu_138_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_4_3_i_fu_154_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_4_4_i_fu_170_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_4_5_i_fu_186_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_4_6_i_fu_202_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_4_7_i_fu_218_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln215_7_fu_228_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln215_6_fu_212_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln215_5_fu_196_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln215_4_fu_180_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln215_3_fu_164_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln215_2_fu_148_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln215_1_fu_132_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln215_fu_116_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";

    component read_stream_32_256_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        axis01_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
        axis01_TVALID : IN STD_LOGIC;
        axis01_TREADY : OUT STD_LOGIC;
        axis01_TKEEP : IN STD_LOGIC_VECTOR (3 downto 0);
        axis01_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        acc_data_V_read : IN STD_LOGIC_VECTOR (255 downto 0);
        ap_return_0 : OUT STD_LOGIC_VECTOR (255 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_return_2 : OUT STD_LOGIC_VECTOR (0 downto 0);
        axis01_TDATA_blk_n : OUT STD_LOGIC;
        ap_ce : IN STD_LOGIC );
    end component;


    component write_stream_256_256_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        acc_data_V_read : IN STD_LOGIC_VECTOR (255 downto 0);
        acc_keep_V_read : IN STD_LOGIC_VECTOR (31 downto 0);
        acc_last_V_read : IN STD_LOGIC_VECTOR (0 downto 0);
        axis00_TDATA : OUT STD_LOGIC_VECTOR (255 downto 0);
        axis00_TVALID : OUT STD_LOGIC;
        axis00_TREADY : IN STD_LOGIC;
        axis00_TKEEP : OUT STD_LOGIC_VECTOR (31 downto 0);
        axis00_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
        axis00_TDATA_blk_n : OUT STD_LOGIC;
        ap_ce : IN STD_LOGIC );
    end component;



begin
    grp_read_stream_32_256_s_fu_70 : component read_stream_32_256_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_read_stream_32_256_s_fu_70_ap_start,
        ap_done => grp_read_stream_32_256_s_fu_70_ap_done,
        ap_idle => grp_read_stream_32_256_s_fu_70_ap_idle,
        ap_ready => grp_read_stream_32_256_s_fu_70_ap_ready,
        axis01_TDATA => axis01_TDATA,
        axis01_TVALID => axis01_TVALID,
        axis01_TREADY => grp_read_stream_32_256_s_fu_70_axis01_TREADY,
        axis01_TKEEP => axis01_TKEEP,
        axis01_TLAST => axis01_TLAST,
        acc_data_V_read => acc_data_V_2_fu_66,
        ap_return_0 => grp_read_stream_32_256_s_fu_70_ap_return_0,
        ap_return_1 => grp_read_stream_32_256_s_fu_70_ap_return_1,
        ap_return_2 => grp_read_stream_32_256_s_fu_70_ap_return_2,
        axis01_TDATA_blk_n => grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n,
        ap_ce => grp_read_stream_32_256_s_fu_70_ap_ce);

    call_ln100_write_stream_256_256_s_fu_81 : component write_stream_256_256_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => call_ln100_write_stream_256_256_s_fu_81_ap_start,
        ap_done => call_ln100_write_stream_256_256_s_fu_81_ap_done,
        ap_idle => call_ln100_write_stream_256_256_s_fu_81_ap_idle,
        ap_ready => call_ln100_write_stream_256_256_s_fu_81_ap_ready,
        acc_data_V_read => call_ln100_write_stream_256_256_s_fu_81_acc_data_V_read,
        acc_keep_V_read => grp_read_stream_32_256_s_fu_70_ap_return_1,
        acc_last_V_read => grp_read_stream_32_256_s_fu_70_ap_return_2,
        axis00_TDATA => call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA,
        axis00_TVALID => call_ln100_write_stream_256_256_s_fu_81_axis00_TVALID,
        axis00_TREADY => call_ln100_write_stream_256_256_s_fu_81_axis00_TREADY,
        axis00_TKEEP => call_ln100_write_stream_256_256_s_fu_81_axis00_TKEEP,
        axis00_TLAST => call_ln100_write_stream_256_256_s_fu_81_axis00_TLAST,
        axis00_TDATA_blk_n => call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n,
        ap_ce => call_ln100_write_stream_256_256_s_fu_81_ap_ce);





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


    grp_read_stream_32_256_s_fu_70_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_read_stream_32_256_s_fu_70_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_NS_fsm_state3) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    grp_read_stream_32_256_s_fu_70_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_read_stream_32_256_s_fu_70_ap_ready = ap_const_logic_1)) then 
                    grp_read_stream_32_256_s_fu_70_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n = ap_const_logic_0) or (grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                acc_data_V_2_fu_66 <= acc_data_V_fu_234_p9;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, ap_CS_fsm_state10, call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n, acc_last_V_fu_107_p1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state7 => 
                if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state7))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state8 => 
                if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state8))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state9 => 
                if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when ap_ST_fsm_state10 => 
                if ((not(((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n = ap_const_logic_0) or (grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state10) and (ap_const_lv1_0 = acc_last_V_fu_107_p1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                elsif ((not(((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n = ap_const_logic_0) or (grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state10) and (ap_const_lv1_1 = acc_last_V_fu_107_p1))) then
                    ap_NS_fsm <= ap_ST_fsm_state11;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when ap_ST_fsm_state11 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXX";
        end case;
    end process;
    acc_data_V_fu_234_p9 <= (((((((add_ln215_7_fu_228_p2 & add_ln215_6_fu_212_p2) & add_ln215_5_fu_196_p2) & add_ln215_4_fu_180_p2) & add_ln215_3_fu_164_p2) & add_ln215_2_fu_148_p2) & add_ln215_1_fu_132_p2) & add_ln215_fu_116_p2);
    acc_last_V_fu_107_p1 <= grp_read_stream_32_256_s_fu_70_ap_return_2;
    add_ln215_1_fu_132_p2 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(p_Result_4_1_i_fu_122_p4));
    add_ln215_2_fu_148_p2 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(p_Result_4_2_i_fu_138_p4));
    add_ln215_3_fu_164_p2 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(p_Result_4_3_i_fu_154_p4));
    add_ln215_4_fu_180_p2 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(p_Result_4_4_i_fu_170_p4));
    add_ln215_5_fu_196_p2 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(p_Result_4_5_i_fu_186_p4));
    add_ln215_6_fu_212_p2 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(p_Result_4_6_i_fu_202_p4));
    add_ln215_7_fu_228_p2 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(p_Result_4_7_i_fu_218_p4));
    add_ln215_fu_116_p2 <= std_logic_vector(unsigned(ap_const_lv32_1) + unsigned(trunc_ln647_fu_112_p1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
    ap_NS_fsm_state3 <= ap_NS_fsm(2);

    ap_block_state10_assign_proc : process(grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n, call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n)
    begin
                ap_block_state10 <= ((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n = ap_const_logic_0) or (grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state11)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state11) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state11)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    axis00_TDATA <= call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA;

    axis00_TDATA_blk_n_assign_proc : process(ap_CS_fsm_state10, call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            axis00_TDATA_blk_n <= call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n;
        else 
            axis00_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    axis00_TKEEP <= call_ln100_write_stream_256_256_s_fu_81_axis00_TKEEP;
    axis00_TLAST <= call_ln100_write_stream_256_256_s_fu_81_axis00_TLAST;
    axis00_TVALID <= call_ln100_write_stream_256_256_s_fu_81_axis00_TVALID;

    axis01_TDATA_blk_n_assign_proc : process(grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, ap_CS_fsm_state10)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            axis01_TDATA_blk_n <= grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n;
        else 
            axis01_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    axis01_TREADY_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, ap_CS_fsm_state10, grp_read_stream_32_256_s_fu_70_axis01_TREADY)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) or (ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            axis01_TREADY <= grp_read_stream_32_256_s_fu_70_axis01_TREADY;
        else 
            axis01_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    call_ln100_write_stream_256_256_s_fu_81_acc_data_V_read <= (((((((add_ln215_7_fu_228_p2 & add_ln215_6_fu_212_p2) & add_ln215_5_fu_196_p2) & add_ln215_4_fu_180_p2) & add_ln215_3_fu_164_p2) & add_ln215_2_fu_148_p2) & add_ln215_1_fu_132_p2) & add_ln215_fu_116_p2);

    call_ln100_write_stream_256_256_s_fu_81_ap_ce_assign_proc : process(grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n, ap_CS_fsm_state10)
    begin
        if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            call_ln100_write_stream_256_256_s_fu_81_ap_ce <= ap_const_logic_1;
        else 
            call_ln100_write_stream_256_256_s_fu_81_ap_ce <= ap_const_logic_0;
        end if; 
    end process;


    call_ln100_write_stream_256_256_s_fu_81_ap_start_assign_proc : process(grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n, ap_CS_fsm_state10)
    begin
        if (((grp_read_stream_32_256_s_fu_70_axis01_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            call_ln100_write_stream_256_256_s_fu_81_ap_start <= ap_const_logic_1;
        else 
            call_ln100_write_stream_256_256_s_fu_81_ap_start <= ap_const_logic_0;
        end if; 
    end process;

    call_ln100_write_stream_256_256_s_fu_81_axis00_TREADY <= (axis00_TREADY and ap_CS_fsm_state10);

    grp_read_stream_32_256_s_fu_70_ap_ce_assign_proc : process(ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, ap_CS_fsm_state10, call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) or (ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or ((call_ln100_write_stream_256_256_s_fu_81_axis00_TDATA_blk_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state10)))) then 
            grp_read_stream_32_256_s_fu_70_ap_ce <= ap_const_logic_1;
        else 
            grp_read_stream_32_256_s_fu_70_ap_ce <= ap_const_logic_0;
        end if; 
    end process;

    grp_read_stream_32_256_s_fu_70_ap_start <= grp_read_stream_32_256_s_fu_70_ap_start_reg;
    p_Result_4_1_i_fu_122_p4 <= grp_read_stream_32_256_s_fu_70_ap_return_0(63 downto 32);
    p_Result_4_2_i_fu_138_p4 <= grp_read_stream_32_256_s_fu_70_ap_return_0(95 downto 64);
    p_Result_4_3_i_fu_154_p4 <= grp_read_stream_32_256_s_fu_70_ap_return_0(127 downto 96);
    p_Result_4_4_i_fu_170_p4 <= grp_read_stream_32_256_s_fu_70_ap_return_0(159 downto 128);
    p_Result_4_5_i_fu_186_p4 <= grp_read_stream_32_256_s_fu_70_ap_return_0(191 downto 160);
    p_Result_4_6_i_fu_202_p4 <= grp_read_stream_32_256_s_fu_70_ap_return_0(223 downto 192);
    p_Result_4_7_i_fu_218_p4 <= grp_read_stream_32_256_s_fu_70_ap_return_0(255 downto 224);
    trunc_ln647_fu_112_p1 <= grp_read_stream_32_256_s_fu_70_ap_return_0(32 - 1 downto 0);
end behav;