#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - dining_philosophers.pml:92 - [(run fullTable())] (0:0:0 - 1)
		IfNotBlocked
		reached[6][1] = 1;
		if (!(addproc(II, 1, 5, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - dining_philosophers.pml:93 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[6][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fullTable */
	case 5: // STATE 1 - dining_philosophers.pml:81 - [((i<n_philosophers))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][1] = 1;
		if (!((((P5 *)this)->_6_7_i<((P5 *)this)->_6_7_n_philosophers)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - dining_philosophers.pml:82 - [(run philosopher(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][2] = 1;
		if (!(addproc(II, 1, 0, ((P5 *)this)->_6_7_i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - dining_philosophers.pml:83 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[5][3] = 1;
		(trpt+1)->bup.oval = ((P5 *)this)->_6_7_i;
		((P5 *)this)->_6_7_i = (((P5 *)this)->_6_7_i+1);
#ifdef VAR_RANGES
		logval("fullTable:i", ((P5 *)this)->_6_7_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 10 - dining_philosophers.pml:87 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[5][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fourPhilosophers */
	case 9: // STATE 1 - dining_philosophers.pml:68 - [((i<n_philosophers))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!((((P4 *)this)->_5_6_i<((P4 *)this)->_5_6_n_philosophers)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 2 - dining_philosophers.pml:69 - [(run philosopher(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (!(addproc(II, 1, 0, ((P4 *)this)->_5_6_i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 3 - dining_philosophers.pml:70 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		(trpt+1)->bup.oval = ((P4 *)this)->_5_6_i;
		((P4 *)this)->_5_6_i = (((P4 *)this)->_5_6_i+1);
#ifdef VAR_RANGES
		logval("fourPhilosophers:i", ((P4 *)this)->_5_6_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 10 - dining_philosophers.pml:74 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC twoSittingTogether */
	case 13: // STATE 1 - dining_philosophers.pml:59 - [(run philosopher(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 2 - dining_philosophers.pml:60 - [(run philosopher(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 3 - dining_philosophers.pml:61 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC twoSittingApart */
	case 16: // STATE 1 - dining_philosophers.pml:54 - [(run philosopher(0))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - dining_philosophers.pml:55 - [(run philosopher(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 3 - dining_philosophers.pml:56 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC oneAtATable */
	case 19: // STATE 1 - dining_philosophers.pml:50 - [(run philosopher(0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 2 - dining_philosophers.pml:51 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC philosopher */
	case 21: // STATE 1 - dining_philosophers.pml:12 - [((forks[id]==0))] (16:0:3 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((int)now.forks[ Index(((P0 *)this)->id, 5) ])==0)))
			continue;
		/* merge: forks[id] = 1(16, 2, 16) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.forks[ Index(((P0 *)this)->id, 5) ]);
		now.forks[ Index(((P0 *)this)->id, 5) ] = 1;
#ifdef VAR_RANGES
		logval("forks[philosopher:id]", ((int)now.forks[ Index(((P0 *)this)->id, 5) ]));
#endif
		;
		/* merge: phils_eating = (phils_eating+1)(16, 3, 16) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[1] = phils_eating;
		phils_eating = (phils_eating+1);
#ifdef VAR_RANGES
		logval("phils_eating", phils_eating);
#endif
		;
		/* merge: phils_eating_now[id] = 1(16, 4, 16) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[2] = phils_eating_now[ Index(((P0 *)this)->id, 5) ];
		phils_eating_now[ Index(((P0 *)this)->id, 5) ] = 1;
#ifdef VAR_RANGES
		logval("phils_eating_now[philosopher:id]", phils_eating_now[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		/* merge: goto thinkRight(16, 5, 16) */
		reached[0][5] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 22: // STATE 10 - dining_philosophers.pml:23 - [((forks[((id+1)%5)]==0))] (19:0:1 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		if (!((((int)now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ])==0)))
			continue;
		/* merge: forks[((id+1)%5)] = 1(19, 11, 19) */
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((int)now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]);
		now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ] = 1;
#ifdef VAR_RANGES
		logval("forks[((philosopher:id+1)%5)]", ((int)now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]));
#endif
		;
		/* merge: goto eat(19, 12, 19) */
		reached[0][12] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 17 - dining_philosophers.pml:31 - [phils_eating = (phils_eating-1)] (0:21:2 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = phils_eating;
		phils_eating = (phils_eating-1);
#ifdef VAR_RANGES
		logval("phils_eating", phils_eating);
#endif
		;
		/* merge: phils_eating_now[id] = 0(21, 18, 21) */
		reached[0][18] = 1;
		(trpt+1)->bup.ovals[1] = phils_eating_now[ Index(((P0 *)this)->id, 5) ];
		phils_eating_now[ Index(((P0 *)this)->id, 5) ] = 0;
#ifdef VAR_RANGES
		logval("phils_eating_now[philosopher:id]", phils_eating_now[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 24: // STATE 20 - dining_philosophers.pml:37 - [((forks[id]==0))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		if (!((((int)now.forks[ Index(((P0 *)this)->id, 5) ])==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 22 - dining_philosophers.pml:42 - [forks[((id+1)%5)] = 0] (0:9:1 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]);
		now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ] = 0;
#ifdef VAR_RANGES
		logval("forks[((philosopher:id+1)%5)]", ((int)now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]));
#endif
		;
		/* merge: goto thinkLeft(9, 23, 9) */
		reached[0][23] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

