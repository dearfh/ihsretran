*------------------------------------------------------------------------------
* Test script for the ihsretran package
*------------------------------------------------------------------------------

version 14.0
clear all
set more off

* Set working directory to where your .ado file is located
cd "C:\Users\user\Desktop\Learn\stata"

* Clear Stata memory of old programs
program drop _all

* Load example dataset
sysuse auto, clear

* Test 1: Basic execution with continuous covariates
di as text _n "=== TEST 1: Basic IHS Marginal Effects ==="
ihsretran price weight length

* Test 2: Execution with a scaling factor and saving predictions
di as text _n "=== TEST 2: Scaling Factor and Generating Predictions ==="
ihsretran price weight length, scale(0.001) generate(pred_price)
**You can change it to scale(1), scale(0.05), scale(10), or whatever makes your coefficients and predictions scale correctly for your specific dataset!
* Inspect the newly generated retransformed predictions
summarize price pred_price

di as text _n "=== All tests completed successfully! ==="
