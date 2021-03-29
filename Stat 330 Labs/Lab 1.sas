/****************************
Name: Pranav Bhagat
Assignment: Lab 1
****************************/

data Joe;
	/* Part 1: Number of years until 16 and 18 */
    years_16 = yrdif(today(), mdy(3, 15, 2013 + 16));
    years_18 = yrdif(today(), mdy(3, 15, 2013 + 18));

	/* Part 2: Car Investment and College Investment */
	car_account = 600*(1 + .02)**years_16 + 600*((1 + .02)**years_16 - 1)/.02;
	college_account = 12000*(1 + .03)**years_18 + 10000*((1 + .03)**years_18 - 1)/.03;

	/* Part 3: Car News and College News */
	if car_account >= 10000 then car_news = "Good News";
	else car_news = "Bad News";

	if college_account >= 100000 then college_news = "Good News";
	else college_news = "Bad News";

run;


proc print data = Joe;
title "Joe";
run;


data Mitch;


    /* Part 1: Number of years until 16 and 18 */
    years_16 = yrdif(today(), mdy(1, 15, 2010 + 16));
	years_18 = yrdif(today(), mdy(1, 15, 2010 + 18));


    /* Part 2: Car Investment and College Investment */
	car_account = 600*(1 + .02)**years_16 + 600*((1 + .02)**years_16 - 1)/.02;
	college_account = 12000*(1 + .03)**years_18 + 10000*((1 + .03)**years_18 - 1)/.03;


    /* Part 3: Car News and College News */
	if car_account >= 10000 then car_news = "Good News";
	else car_news = "Bad News";

	if college_account >= 100000 then college_news = "Good News";
	else college_news = "Bad News";

run;


proc print data = Mitch;
title "Mitch";
run;


data Scott;
	/* Part 1: Number of years until 16 and 18 */
	years_16 = yrdif(today(), mdy(11, 25, 2006 + 16));
	years_18 = yrdif(today(), mdy(11, 25, 2006 + 18));

    /* Part 2: Car Investment and College Investment */
	car_account = 600*(1 + .02)**years_16 + 600*((1 + .02)**years_16 - 1)/.02;
	college_account = 12000*(1 + .03)**years_18 + 10000*((1 + .03)**years_18 - 1)/.03;

	/* Part 3: Car News and College News */
	if car_account >= 10000 then car_news = "Good News";
	else car_news = "Bad News";
	if college_account >= 100000 then college_news = "Good News";
	else college_news = "Bad News";

run;


proc print data = Scott;
title "Scott";
run;
