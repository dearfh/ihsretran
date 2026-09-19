# ihsretran

`ihsretran` is a user-written Stata module that calculates consistent marginal effects on the original scale of the outcome variable after estimating a linear regression where the dependent variable has been transformed using the inverse hyperbolic sine function (`asinh()`). 

This command implements **Duan's (1983) nonparametric smearing estimate** to properly handle the retransformation problem, following the methodology outlined by **Edward C. Norton (2022)** in *The Stata Journal*.

---

## Author

* **Dereje Fedasa**
* Department of Economics
* Dire Dawa University, Ethiopia
*derejefedasaa@gmail.com
---

## Features

- Handles variables transformed by the inverse hyperbolic sine function ($\text{asinh}$).
- Accounts for non-invariant scaling factors (`scale()`).
- Automatically applies robust standard errors (`vce(robust)`).
- Computes population-averaged marginal effects on the original data scale using Stata's native `margins` command via the delta-method.
- Allows saving retransformed predictions directly to your dataset (`generate()`).

---

## Installation

You can install `ihsretran` directly from GitHub by executing the following command in Stata:

**stata
net install ihsretran, from("https://raw.githubusercontent.com/dearfh/ihsretran/main/")
To view the help file after installation, type:
help ihsretran
Syntax
ihsretran depvar indepvars [if] [in] [, scale(#) generate(newvar) level(#)]

Options
scale(#): Scaling factor multiplier for the dependent variable prior to transformation. Default is scale(1.0).
generate(newvar): Generates a new variable containing retransformed predicted values on the original scale adjusted by Duan's smearing factor.
level(#): Sets the confidence level for confidence intervals. Default is level(95).
Quick Example
* Load example dataset
sysuse auto, clear

* Run ihsretran with a custom scale factor and save predictions
ihsretran price weight length, scale(0.001) generate(pred_price)

* Inspect the results
summarize price pred_price
References
Aihounton, G. B. D., and A. Henningsen. 2021. Units of measurement and the inverse hyperbolic sine transformation. Econometric Journal 24(2): 334–351.
Duan, N. 1983. Smearing estimate: A nonparametric retransformation method. Journal of the American Statistical Association 78(383): 605–610.
Norton, E. C. 2022. The inverse hyperbolic sine transformation and retransformed marginal effects. The Stata Journal 22(3): 702–712.
