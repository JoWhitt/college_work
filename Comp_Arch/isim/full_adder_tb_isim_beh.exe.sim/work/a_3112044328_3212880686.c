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
static const char *ng0 = "//tholos.itserv.scss.tcd.ie/ugrad/whittamj/GitHub/college_work/Comp_Arch/full_adder.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );


static void work_a_3112044328_3212880686_p_0(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(34, ng0);

LAB3:    t1 = (1 * 1000LL);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t6 = *((unsigned char *)t5);
    t7 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t4, t6);
    t2 = (t0 + 1032U);
    t8 = *((char **)t2);
    t9 = *((unsigned char *)t8);
    t2 = (t0 + 1192U);
    t10 = *((char **)t2);
    t11 = *((unsigned char *)t10);
    t12 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t9, t11);
    t2 = (t0 + 1352U);
    t13 = *((char **)t2);
    t14 = *((unsigned char *)t13);
    t15 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t12, t14);
    t16 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t7, t15);
    t2 = (t0 + 3496);
    t17 = (t2 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = t16;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t21 = (t0 + 3496);
    xsi_driver_intertial_reject(t21, t1, t1);

LAB2:    t22 = (t0 + 3400);
    *((int *)t22) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3112044328_3212880686_p_1(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(35, ng0);

LAB3:    t1 = (1 * 1000LL);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t6 = *((unsigned char *)t5);
    t7 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t4, t6);
    t2 = (t0 + 1352U);
    t8 = *((char **)t2);
    t9 = *((unsigned char *)t8);
    t10 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t7, t9);
    t2 = (t0 + 3560);
    t11 = (t2 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t15 = (t0 + 3560);
    xsi_driver_intertial_reject(t15, t1, t1);

LAB2:    t16 = (t0 + 3416);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3112044328_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3112044328_3212880686_p_0,(void *)work_a_3112044328_3212880686_p_1};
	xsi_register_didat("work_a_3112044328_3212880686", "isim/full_adder_tb_isim_beh.exe.sim/work/a_3112044328_3212880686.didat");
	xsi_register_executes(pe);
}
