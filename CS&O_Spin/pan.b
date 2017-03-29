	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC fullTable */
;
		;
		
	case 6: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 3
		;
		((P5 *)this)->_6_7_i = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC fourPhilosophers */
;
		;
		
	case 10: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 3
		;
		((P4 *)this)->_5_6_i = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 10
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC twoSittingTogether */

	case 13: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 15: // STATE 3
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC twoSittingApart */

	case 16: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 17: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 18: // STATE 3
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC oneAtATable */

	case 19: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 20: // STATE 2
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC philosopher */

	case 21: // STATE 4
		;
		phils_eating_now[ Index(((P0 *)this)->id, 5) ] = trpt->bup.ovals[2];
		phils_eating = trpt->bup.ovals[1];
		now.forks[ Index(((P0 *)this)->id, 5) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 22: // STATE 11
		;
		now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ] = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 18
		;
		phils_eating_now[ Index(((P0 *)this)->id, 5) ] = trpt->bup.ovals[1];
		phils_eating = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 25: // STATE 22
		;
		now.forks[ Index(((((P0 *)this)->id+1)%5), 5) ] = trpt->bup.oval;
		;
		goto R999;
	}

