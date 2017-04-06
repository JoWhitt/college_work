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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/whittamj/GitHub/college_work/Comp_Arch/project2/register_file_64_tb.vhd";
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
    int64 t10;
    int t11;
    int t12;
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
LAB4:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 6940);
    t5 = (t0 + 3872);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 6956);
    t5 = (t0 + 3936);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 2);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t3);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 6962);
    *((int *)t2) = 0;
    t4 = (t0 + 6966);
    *((int *)t4) = 62;
    t11 = 0;
    t12 = 62;

LAB16:    if (t11 <= t12)
        goto LAB17;

LAB19:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 4);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB35:    *((char **)t1) = &&LAB36;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB17:    xsi_set_current_line(84, ng0);
    t5 = (t0 + 3808);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t2 = (t0 + 6828U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t4, t2, 1);
    t6 = (t0 + 3936);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t14 = *((char **)t9);
    memcpy(t14, t5, 6U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t2 = (t0 + 6844U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t4, t2, 1);
    t6 = (t0 + 3872);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t14 = *((char **)t9);
    memcpy(t14, t5, 16U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t3);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB18:    t2 = (t0 + 6962);
    t11 = *((int *)t2);
    t4 = (t0 + 6966);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB19;

LAB32:    t15 = (t11 + 1);
    t11 = t15;
    t5 = (t0 + 6962);
    *((int *)t5) = t11;
    goto LAB16;

LAB20:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t10 = (t3 * 2);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t10);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    goto LAB18;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB33:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 3808);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 6970);
    t5 = (t0 + 4000);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 6976);
    *((int *)t2) = 0;
    t4 = (t0 + 6980);
    *((int *)t4) = 63;
    t11 = 0;
    t12 = 63;

LAB37:    if (t11 <= t12)
        goto LAB38;

LAB40:    xsi_set_current_line(101, ng0);

LAB48:    *((char **)t1) = &&LAB49;
    goto LAB1;

LAB34:    goto LAB33;

LAB36:    goto LAB34;

LAB38:    xsi_set_current_line(97, ng0);
    t5 = (t0 + 2128U);
    t6 = *((char **)t5);
    t3 = *((int64 *)t6);
    t10 = (t3 * 4);
    t5 = (t0 + 3168);
    xsi_process_wait(t5, t10);

LAB43:    *((char **)t1) = &&LAB44;
    goto LAB1;

LAB39:    t2 = (t0 + 6976);
    t11 = *((int *)t2);
    t4 = (t0 + 6980);
    t12 = *((int *)t4);
    if (t11 == t12)
        goto LAB40;

LAB45:    t15 = (t11 + 1);
    t11 = t15;
    t5 = (t0 + 6976);
    *((int *)t5) = t11;
    goto LAB37;

LAB41:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 6828U);
    t5 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t4, t2, 1);
    t6 = (t0 + 4000);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t14 = *((char **)t9);
    memcpy(t14, t5, 6U);
    xsi_driver_first_trans_fast(t6);
    goto LAB39;

LAB42:    goto LAB41;

LAB44:    goto LAB42;

LAB46:    goto LAB2;

LAB47:    goto LAB46;

LAB49:    goto LAB47;

}


extern void work_a_2367098887_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2367098887_2372691052_p_0,(void *)work_a_2367098887_2372691052_p_1};
	xsi_register_didat("work_a_2367098887_2372691052", "isim/register_file_64_tb_isim_beh.exe.sim/work/a_2367098887_2372691052.didat");
	xsi_register_executes(pe);
}
