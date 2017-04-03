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
	case 3: // STATE 1 - dining_philosophers.pml:99 - [(run fourPhilosophers())] (0:0:0 - 1)
		IfNotBlocked
		reached[6][1] = 1;
		if (!(addproc(II, 1, 4, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - dining_philosophers.pml:100 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[6][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fullTable */
	case 5: // STATE 1 - dining_philosophers.pml:88 - [((i<n_philosophers))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][1] = 1;
		if (!((((P5 *)this)->_6_6_i<((P5 *)this)->_6_6_n_philosophers)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - dining_philosophers.pml:89 - [(run philosopher(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[5][2] = 1;
		if (!(addproc(II, 1, 0, ((P5 *)this)->_6_6_i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 3 - dining_philosophers.pml:90 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[5][3] = 1;
		(trpt+1)->bup.oval = ((P5 *)this)->_6_6_i;
		((P5 *)this)->_6_6_i = (((P5 *)this)->_6_6_i+1);
#ifdef VAR_RANGES
		logval("fullTable:i", ((P5 *)this)->_6_6_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 10 - dining_philosophers.pml:94 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[5][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC fourPhilosophers */
	case 9: // STATE 1 - dining_philosophers.pml:75 - [((i<n_philosophers))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!((((P4 *)this)->_5_5_i<((P4 *)this)->_5_5_n_philosophers)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 2 - dining_philosophers.pml:76 - [(run philosopher(i))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (!(addproc(II, 1, 0, ((P4 *)this)->_5_5_i)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 3 - dining_philosophers.pml:77 - [i = (i+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[4][3] = 1;
		(trpt+1)->bup.oval = ((P4 *)this)->_5_5_i;
		((P4 *)this)->_5_5_i = (((P4 *)this)->_5_5_i+1);
#ifdef VAR_RANGES
		logval("fourPhilosophers:i", ((P4 *)this)->_5_5_i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 10 - dining_philosophers.pml:81 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC twoSittingTogether */
	case 13: // STATE 1 - dining_philosophers.pml:66 - [(run philosopher(1))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 0, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 2 - dining_philosophers.pml:67 - [(run philosopher(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 3 - dining_philosophers.pml:68 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC twoSittingApart */
	case 16: // STATE 1 - dining_philosophers.pml:61 - [(run philosopher(0))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 2 - dining_philosophers.pml:62 - [(run philosopher(2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 1, 0, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 3 - dining_philosophers.pml:63 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC oneAtATable */
	case 19: // STATE 1 - dining_philosophers.pml:57 - [(run philosopher(0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!(addproc(II, 1, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 20: // STATE 2 - dining_philosophers.pml:58 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC philosopher */
	case 21: // STATE 1 - dining_philosophers.pml:14 - [timeToStarvation[id] = 1000] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = now.timeToStarvation[ Index(((P0 *)this)->id, 5) ];
		now.timeToStarvation[ Index(((P0 *)this)->id, 5) ] = 1000;
#ifdef VAR_RANGES
		logval("timeToStarvation[philosopher:id]", now.timeToStarvation[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 2 - dining_philosophers.pml:16 - [((forks[id]==0))] (25:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		if (!((now.forks[ Index(((P0 *)this)->id, 5) ]==0)))
			continue;
		/* merge: forks[id] = id(25, 3, 25) */
		reached[0][3] = 1;
		(trpt+1)->bup.oval = now.forks[ Index(((P0 *)this)->id, 5) ];
		now.forks[ Index(((P0 *)this)->id, 5) ] = ((P0 *)this)->id;
#ifdef VAR_RANGES
		logval("forks[philosopher:id]", now.forks[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		/* merge: goto thinkRight(25, 4, 25) */
		reached[0][4] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 5 - dining_philosophers.pml:19 - [((timeToStarvation[id]<=0))] (33:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((now.timeToStarvation[ Index(((P0 *)this)->id, 5) ]<=0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: id */  (trpt+1)->bup.oval = ((P0 *)this)->id;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->id = 0;
		/* merge: goto starve(0, 6, 33) */
		reached[0][6] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 24: // STATE 8 - dining_philosophers.pml:20 - [timeToStarvation[id] = (timeToStarvation[id]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		(trpt+1)->bup.oval = now.timeToStarvation[ Index(((P0 *)this)->id, 5) ];
		now.timeToStarvation[ Index(((P0 *)this)->id, 5) ] = (now.timeToStarvation[ Index(((P0 *)this)->id, 5) ]-1);
#ifdef VAR_RANGES
		logval("timeToStarvation[philosopher:id]", now.timeToStarvation[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 13 - dining_philosophers.pml:27 - [((forks[((id+1)%5)]==0))] (28:0:3 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		if (!((now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]==0)))
			continue;
		/* merge: forks[((id+1)%5)] = id(28, 14, 28) */
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ];
		now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ] = ((P0 *)this)->id;
#ifdef VAR_RANGES
		logval("forks[((philosopher:id+1)%5)]", now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]);
#endif
		;
		/* merge: phils_eating = (phils_eating+1)(28, 15, 28) */
		reached[0][15] = 1;
		(trpt+1)->bup.ovals[1] = phils_eating;
		phils_eating = (phils_eating+1);
#ifdef VAR_RANGES
		logval("phils_eating", phils_eating);
#endif
		;
		/* merge: phils_eating_now[id] = 1(28, 16, 28) */
		reached[0][16] = 1;
		(trpt+1)->bup.ovals[2] = phils_eating_now[ Index(((P0 *)this)->id, 5) ];
		phils_eating_now[ Index(((P0 *)this)->id, 5) ] = 1;
#ifdef VAR_RANGES
		logval("phils_eating_now[philosopher:id]", phils_eating_now[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		/* merge: goto eat(28, 17, 28) */
		reached[0][17] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 26: // STATE 18 - dining_philosophers.pml:32 - [((timeToStarvation[id]<=0))] (33:0:1 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (!((now.timeToStarvation[ Index(((P0 *)this)->id, 5) ]<=0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: id */  (trpt+1)->bup.oval = ((P0 *)this)->id;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->id = 0;
		/* merge: goto starve(0, 19, 33) */
		reached[0][19] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 27: // STATE 21 - dining_philosophers.pml:33 - [timeToStarvation[id] = (timeToStarvation[id]-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][21] = 1;
		(trpt+1)->bup.oval = now.timeToStarvation[ Index(((P0 *)this)->id, 5) ];
		now.timeToStarvation[ Index(((P0 *)this)->id, 5) ] = (now.timeToStarvation[ Index(((P0 *)this)->id, 5) ]-1);
#ifdef VAR_RANGES
		logval("timeToStarvation[philosopher:id]", now.timeToStarvation[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 26 - dining_philosophers.pml:40 - [phils_eating = (phils_eating-1)] (0:32:2 - 1)
		IfNotBlocked
		reached[0][26] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = phils_eating;
		phils_eating = (phils_eating-1);
#ifdef VAR_RANGES
		logval("phils_eating", phils_eating);
#endif
		;
		/* merge: phils_eating_now[id] = 0(32, 27, 32) */
		reached[0][27] = 1;
		(trpt+1)->bup.ovals[1] = phils_eating_now[ Index(((P0 *)this)->id, 5) ];
		phils_eating_now[ Index(((P0 *)this)->id, 5) ] = 0;
#ifdef VAR_RANGES
		logval("phils_eating_now[philosopher:id]", phils_eating_now[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 29: // STATE 29 - dining_philosophers.pml:46 - [forks[id] = 0] (0:12:2 - 1)
		IfNotBlocked
		reached[0][29] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = now.forks[ Index(((P0 *)this)->id, 5) ];
		now.forks[ Index(((P0 *)this)->id, 5) ] = 0;
#ifdef VAR_RANGES
		logval("forks[philosopher:id]", now.forks[ Index(((P0 *)this)->id, 5) ]);
#endif
		;
		/* merge: forks[((id+1)%5)] = 0(12, 30, 12) */
		reached[0][30] = 1;
		(trpt+1)->bup.ovals[1] = now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ];
		now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ] = 0;
#ifdef VAR_RANGES
		logval("forks[((philosopher:id+1)%5)]", now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ]);
#endif
		;
		/* merge: goto thinkLeft(12, 31, 12) */
		reached[0][31] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 30: // STATE 34 - dining_philosophers.pml:51 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][34] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

