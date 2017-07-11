<h1 align="center">
  <a href="http://java.com/en"><img src="java.jpg" alt="Java" width="200"></a>
  <br>
  <br>
  Academic Manager
  <br>
  <br>
</h1>
<h4 align="center">A simple java program to calculate the charge of residents water usage</h4>

<p align="center">
  <a href=""><img src="https://img.shields.io/travis/feross/standard/master.svg" alt="Passing"></a>
  <a href="https://java.com/en/"><img src="https://img.shields.io/badge/Java-1.8.0__101-brightgreen.svg" alt="Java 1.8.0"></a>
  <a href="https://opensource.org/licenses/BSD-2-Clause"><img src="https://img.shields.io/badge/License-BSD-blue.svg" alt="npm downloads"></a>
</p>
<br>

## Table of Contents
- [Synopsis](#synopsis)
- [Install](#install)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [License](#license)
## Synopsis
The problem put forward was to design a program that could calculate 
a residents water usage based on a tier pricing schedule. It was required 
that the user is asked for a residents name and water usage and upon 
completion of the data entry, the user would be displayed a summary of 
the information in tabular form along with the average, max and total of all 
residents calculated charge.

The program was required to use the given classes of WaterChargeCalculator 
and WaterChargeCalculatorTest. Modules beginCharge, calculateCharge and 
displayInfo were to be used in the final code.
## Install
First, make a directory to install the files to and change to that directory using :
```bash
 mkdir academicmanager && cd academicmanager
```
Then all you need to do is clone the project from github into the directory by using :
```bash
 git clone https://github.com/josh-privata/AcademicManager.git
```
## Usage
##### Note:  [Java Runtime](https://java.com/en/download/) is required to run the preceding commands.
Initially the program needs to be compiled. After you have copied the *.java files to a directory, run the command :
```bash
$ javac AcademicManager.java
```
Then run the program using the command :
```bash
$ java AcademicManager
```
## Screenshots
![ScreenShot](img/smallscreen.jpg)
## License
[BSD](LICENSE) Copyright (c) 2016 [Josh Cannons](http://joshcannons.com).