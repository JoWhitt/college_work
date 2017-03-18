/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x1cce1bb2 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/whittamj/GitHub/college_work/Comp_Arch/full_adder_tb.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_2249932033_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    int t9;
    int t10;
    int t11;
    char *t12;
    int t13;
    int t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    int t18;

LAB0:    t1 = (t0 + 2832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(71, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 2640);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3216);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3280);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3344);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 5569);
    *((int *)t2) = 0;
    t4 = (t0 + 5573);
    *((int *)t4) = 1;
    t8 = 0;
    t9 = 1;

LAB8:    if (t8 <= t9)
        goto LAB9;

LAB11:    xsi_set_current_line(91, ng0);

LAB29:    *((char **)t1) = &&LAB30;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(80, ng0);
    t5 = (t0 + 5577);
    *((int *)t5) = 0;
    t6 = (t0 + 5581);
    *((int *)t6) = 1;
    t10 = 0;
    t11 = 1;

LAB12:    if (t10 <= t11)
        goto LAB13;

LAB15:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t16 = *((unsigned char *)t4);
    t17 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t16);
    t2 = (t0 + 3216);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    *((unsigned char *)t12) = t17;
    xsi_driver_first_trans_fast(t2);

LAB10:    t2 = (t0 + 5569);
    t8 = *((int *)t2);
    t4 = (t0 + 5573);
    t9 = *((int *)t4);
    if (t8 == t9)
        goto LAB11;

LAB26:    t10 = (t8 + 1);
    t8 = t10;
    t5 = (t0 + 5569);
    *((int *)t5) = t8;
    goto LAB8;

LAB13:    xsi_set_current_line(82, ng0);
    t7 = (t0 + 5585);
    *((int *)t7) = 0;
    t12 = (t0 + 5589);
    *((int *)t12) = 1;
    t13 = 0;
    t14 = 1;

LAB16:    if (t13 <= t14)
        goto LAB17;

LAB19:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t16 = *((unsigned char *)t4);
    t17 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t16);
    t2 = (t0 + 3280);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    *((unsigned char *)t12) = t17;
    xsi_driver_first_trans_fast(t2);

LAB14:    t2 = (t0 + 5577);
    t10 = *((int *)t2);
    t4 = (t0 + 5581);
    t11 = *((int *)t4);
    if (t10 == t11)
        goto LAB15;

LAB25:    t13 = (t10 + 1);
    t10 = t13;
    t5 = (t0 + 5577);
    *((int *)t5) = t10;
    goto LAB12;

LAB17:    xsi_set_current_line(83, ng0);
    t3 = (10 * 1000LL);
    t15 = (t0 + 2640);
    xsi_process_wait(t15, t3);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB18:    t2 = (t0 + 5585);
    t13 = *((int *)t2);
    t4 = (t0 + 5589);
    t14 = *((int *)t4);
    if (t13 == t14)
        goto LAB19;

LAB24:    t18 = (t13 + 1);
    t13 = t18;
    t5 = (t0 + 5585);
    *((int *)t5) = t13;
    goto LAB16;

LAB20:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t16 = *((unsigned char *)t4);
    t17 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t16);
    t2 = (t0 + 3344);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    *((unsigned char *)t12) = t17;
    xsi_driver_first_trans_fast(t2);
    goto LAB18;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB27:    goto LAB2;

LAB28:    goto LAB27;

LAB30:    goto LAB28;

}


extern void work_a_2249932033_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2249932033_2372691052_p_0};
	xsi_register_didat("work_a_2249932033_2372691052", "isim/full_adder_tb_isim_beh.exe.sim/work/a_2249932033_2372691052.didat");
	xsi_register_executes(pe);
}
