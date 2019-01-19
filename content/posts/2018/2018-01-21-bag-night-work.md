---
date: 2018-01-21
title: Bag Night, Good Work!
season: 2018
---
The checkout of all the autonomous moves went very well.  I had to jumper out some code so only the chassis was working.  Also had to add some more debug to force all the enums to be correct to test the code.  Overall it was great and only had to make a couple of corrections.  The one laptop is labeled comp-bot with all the adjustments in the travel paths. Bellow are new spread sheets to assist in the calculations of the distances.

<table border="1" style="margin: 20px">
<thead><tr class="tableizer-firstrow"><th>Wheel spacing</th><th>25</th><th>&nbsp;</th><th>center location to left switch</th><th>center location to right switch</th><th>left location to left scale</th><th>right location to right scale</th><th>left location to left switch</th><th>right location to right switch</th></tr></thead><tbody>
 <tr><td>Robot length w bumper</td><td>38</td><td>delta x</td><td>-59</td><td>49</td><td>44.1875</td><td>-44.1875</td><td>62.1875</td><td>-62.1875</td></tr>
 <tr><td>Robot width w bumpter</td><td>34</td><td>delta y</td><td>102</td><td>102</td><td>261.65</td><td>261.65</td><td>102</td><td>102</td></tr>
 <tr><td>switch from end wall</td><td>140</td><td>radius</td><td>29.5</td><td>24.5</td><td>796.7553907</td><td>796.7553907</td><td>114.7440013</td><td>114.7440013</td></tr>
 <tr><td>scale from end wall</td><td>299.65</td><td>inner R</td><td>17</td><td>12</td><td>784.2553907</td><td>784.2553907</td><td>102.2440013</td><td>102.2440013</td></tr>
 <tr><td>&nbsp;</td><td>&nbsp;</td><td>outer R</td><td>42</td><td>37</td><td>809.2553907</td><td>809.2553907</td><td>127.2440013</td><td>127.2440013</td></tr>
 <tr><td>&nbsp;</td><td>&nbsp;</td><td>arc</td><td>0.25</td><td>0.25</td><td>0.053253751</td><td>0.053253751</td><td>0.174277133</td><td>0.174277133</td></tr>
 <tr><td>Edge of left portal from center</td><td>-133.1875</td><td>adj X</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
 <tr><td>Left placement robot center position</td><td>-116.1875</td><td>adj y</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>
 <tr><td>Left scale plate center</td><td>-72</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
 <tr><td>Left switch plate center</td><td>-54</td><td>left 1</td><td>26.70353756</td><td>58.11946409</td><td>270.7794325</td><td>262.4143529</td><td>139.3341567</td><td>111.9587686</td></tr>
 <tr><td>center location robot center position</td><td>5</td><td>right 1</td><td>65.97344573</td><td>18.84955592</td><td>262.4143529</td><td>270.7794325</td><td>111.9587686</td><td>139.3341567</td></tr>
 <tr><td>right switch plate center</td><td>54</td><td>left 2</td><td>65.97344573</td><td>18.84955592</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
 <tr><td>right scale plate  center</td><td>72</td><td>right 2</td><td>26.70353756</td><td>58.11946409</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
 <tr><td>right placement robot center position</td><td>116.1875</td><td>left 3</td><td>43</td><td>53</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
 <tr><td>edge of right portal from center</td><td>133.1875</td><td>right 3</td><td>43</td><td>53</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td></td></tr>
</tbody></table>

There is an adjustment in x and y for fine tuning. All of you should take a look at the spread sheet and make sure you know how to use it.  I tried to arrange it so one spread sheet has all the necessary paths on it.  

We really need to debug the driver station setting to the auto init code for all the sub-systems. In order to debug some items I had to add code to all the autoinit IF blocks to make sure what branch was executing.  This needs to be removed once we are sure all the interface is working.  I also had to add some small code for the adjustment of timers for step 1 from 2.5 seconds to 7 seconds on the long moves to the scale.  We need to review this and clean it up better.

Everyone did great Tuesday considering we had to re-fix a couple of things before we could run the robot and autonomous.  It looks like we will need a way to take manual control of the elevator in the event of an encoder problem.  The fact that we did a center to switch autonomous successfully was great.

Looking forward to Thursday.  We are in great shape but we need to really have good discipline on how we fix and document things for the next two weeks.  

>Dave
