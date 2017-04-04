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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/whittamj/GitHub/college_work/Comp_Arch/Project_2/Project_2/register_file_64_tb.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );


static void work_a_2367098887_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2920);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2920);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2367098887_2372691052_p_1(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    int64 t12;
    char *t14;
    int t15;

LAB0:    t1 = (t0 + 3360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(72, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 7068);
    t5 = (t0 + 3872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 7084);
    t5 = (t0 + 3936);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 7090);
    *((int *)t2) = 0;
    t4 = (t0 + 7094);
    *((int *)t4) = 64;
    t10 = 0;
    t11 = 64;

LAB8:    if (t10 <= t11)
        goto LAB9;

LAB11:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t12 = (t3 * 4);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB23:    *((char **)t1) = &&LAB24;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(80, ng0);
    t5 = (t0 + 2128U);
    t6 = *((char **)t5);
    t3 = *((int64 *)t6);
    t12 = (t3 * 1);
    t5 = (t0 + 3168);
    xsi_process_wait(t5, t12);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB10:    t2 = (t0 + 7090);
    t10 = *((int *)t2);
    t4 = (t0 + 7094);
    t11 = *((int *)t4);
    if (t10 == t11)
        goto LAB11;

LAB20:    t15 = (t10 + 1);
    t10 = t15;
    t5 = (t0 + 7090);
    *((int *)t5) = t10;
    goto LAB8;

LAB12:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t2 = (t0 + 6972U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t4, t2, 1);
    t6 = (t0 + 3872);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t14 = *((char **)t9);
    memcpy(t14, t5, 16U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t2 = (t0 + 6956U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t4, t2, 1);
    t6 = (t0 + 3936);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t14 = *((char **)t9);
    memcpy(t14, t5, 6U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t12 = (t3 * 2);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t12);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB10;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB21:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 7098);
    t5 = (t0 + 4000);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 7104);
    *((int *)t2) = 0;
    t4 = (t0 + 7108);
    *((int *)t4) = 7;
    t10 = 0;
    t11 = 7;

LAB25:    if (t10 <= t11)
        goto LAB26;

LAB28:    xsi_set_current_line(100, ng0);

LAB36:    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB22:    goto LAB21;

LAB24:    goto LAB22;

LAB26:    xsi_set_current_line(95, ng0);
    t5 = (t0 + 2128U);
    t6 = *((char **)t5);
    t3 = *((int64 *)t6);
    t12 = (t3 * 4);
    t5 = (t0 + 3168);
    xsi_process_wait(t5, t12);

LAB31:    *((char **)t1) = &&LAB32;
    goto LAB1;

LAB27:    t2 = (t0 + 7104);
    t10 = *((int *)t2);
    t4 = (t0 + 7108);
    t11 = *((int *)t4);
    if (t10 == t11)
        goto LAB28;

LAB33:    t15 = (t10 + 1);
    t10 = t15;
    t5 = (t0 + 7104);
    *((int *)t5) = t10;
    goto LAB25;

LAB29:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 6956U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t4, t2, 9);
    t6 = (t0 + 4000);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t14 = *((char **)t9);
    memcpy(t14, t5, 6U);
    xsi_driver_first_trans_fast(t6);
    goto LAB27;

LAB30:    goto LAB29;

LAB32:    goto LAB30;

LAB34:    goto LAB2;

LAB35:    goto LAB34;

LAB37:    goto LAB35;

}


extern void work_a_2367098887_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2367098887_2372691052_p_0,(void *)work_a_2367098887_2372691052_p_1};
	xsi_register_didat("work_a_2367098887_2372691052", "isim/register_file_64_tb_isim_beh.exe.sim/work/a_2367098887_2372691052.didat");
	xsi_register_executes(pe);
}
