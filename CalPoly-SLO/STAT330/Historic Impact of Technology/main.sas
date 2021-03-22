*Dataset;
libname midterm "/folders/myfolders/My_data";

/* Data step for observations including the gdp and life expectancy. */
data countries;
set midterm.gapminder_data;

/* GDP Analysis*/
/* Doing confidence intervals for the mean of gdp by region */
title "Confidence levels for mean gdp by region";
proc means data = countries clm;
class regions;
run;

/*Doing anova and multiple comparisons */
proc anova data = countries;
class four_regions;
model gdp = regions;
means regions / hovtest tukey;
quit;

/*Scatterplot of advanced countries GDP by continent */
 proc sgplot data = specific_countries;
where year >= 1950;
scatter y=gdp x=year / group=country
markerattrs=(symbol=CircleFilled size=5)
colormodel=TwoColorRamp;
xaxis label="Year";
yaxis label="GDP";
title "Scatterplot of GDP by Year (Specific Countries)";
run;

/*Life Expectancy */
proc corr data=midterm.gapminder_data;
var life_exp gdp;
run;

*Generate the correlation and coefficient between Life Expectancy and GDP;
proc sgplot data=midterm.gapminder_data;
scatter x=GDP y=life_exp;
run;

/* Histogram using proc univariate */
Title "Histograms of Current Life Expectancy by Region";
proc univariate data=current;
class four_regions;
var life_exp;
histogram life_exp / nrows=4 odstitle="Distribution of Life Expectancy By Region"
vaxislabel= "Europe Asia Americas Africa";
ods select histogram;
run;

/* GIF Code */
%macro GapMinder(start=, end=, incr=); %do year=&start %to &end %by &incr;
proc sgplot data=midterm.gapminder_data
noautolegend;
format gdp dollar12.0;
where year=&year;
format country $country.;
bubble x=gdp y=life_exp
size=population / group=four_regions
 dataskin=gloss
bradiusmin=2 bradiusmax=50;
 keylegend;

inset "&year" / position=bottomright textattrs=(size=60 weight=bold color=lightgray);
xaxis type=log offsetmin=0.05 offsetmax=0.08 logstyle=linear
grid min=100 max=60000;
yaxis offsetmin=0.05 offsetmax=0.05 grid min=30 max=90;
run;
%end;
%mend GapMinder;
 options papersize=('5 in', '3 in')
printerpath=gif
animation=start animduration=0.1 animloop=yes noanimoverlay;
ods printer file= "/folders/myfolders/sasuser.v94/MidtermProject.gif";
ods graphics / width=5in height=3in imagefmt=GIF;
%GapMinder(start=1960, end=2020, incr=2);
options printerpath=gif animation=stop;
ods printer close;

/*Literacy Rate */
*Graph of boxplots of literacy rates;
 proc sgplot data = midterm.gapminder_data;
 title "Boxplots showing Literacy rate over the past 2 decades";
where year >= 1990 and year <= 2010;
vbox literacy_rate / category = year;
 run;

*The line plot of literacy rates of each region from 1960-2020;
data recent;
set midterm.gapminder_data;
if year >= 1960 and year <= 2020;
run;
proc sgplot data = recent;
vline year / response=literacy_rate group=four_regions stat=mean;
yaxis label = "Avg Region Literacy Rate";
xaxis value = (1960 to 2020 by 4);
run;

*The numeric correlation between life expectancy and literacy rate;
 proc corr data = midterm.gapminder_data;
 title "Is there correlation between literacy rate and life expectancy";
 var life_exp literacy_rate;
 run;
