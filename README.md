**Test task for *Dino Systems* (March 2019)*

During the assignment, I learned several new things:
1) I got and idea of MySQL usage and learned how to configure and setup it (only used Oracle SQL Developer before).
2) Learned how to create databases and upload data into them.
3) Figured out database structure and learned new methods in MySQL such as *timestampdiff*

**Task 1 - Total Expenses**
1) Made a query which returned amount of seconds during calls of people who called somebody - https://imgur.com/a/szFN79G
2) The calls are free for outgoing calls to phone numbers from Numbers table, so I filtered those people out, leaving only those who are not in that table - https://imgur.com/a/b2Y7SxG
3) Made a sum of all seconds of all calls I've gotten - https://imgur.com/a/GZILgyA
4) And finally, multiplied that number of seconds by 0.04, for us to get total amount of expenses - https://imgur.com/a/aaHFci7 .

*So the answer to that question should be **150.76**, whatever it may be, rubles or dollars.*

-------

**Task 2 - Top 10 most active users**
1) As most active I see people who spent the largest amount of time talking, would it be incoming calls or outcoming.
2) For us to count how many minutes each distinct user spent talking, I'm grouping call_logs by User ID, and make a sum of minutes each of them talked, sorting them already and limiting result by 10 - https://imgur.com/a/Y3OYPjf .
3) After that, for us to get the names of users, we just need to join *call_logs* table and *users* table - https://imgur.com/a/J6fxt77
4) **But** it's not finished! After I joined that tables, I decided to double-check the results, and that was right - results were changed, there were another people in top-10 with the names, and I realised that there can be users who are not in users table, we dont have their names. So I changed my query, making it a left join, and added the IFNULL to set a placeholder for nulls in names - https://imgur.com/a/UhTQz70 . (I decided to add that part for company to see my thought process).

**So the answer for "Who is top 10 most active users?" is:**
user_id Name      seconds_talked
45492	  Undefined	  899
22719	  Alex	      866
40156	  Roman	      820
33998	  Undefined	  740
19047	  Timmy	      694
28866	  Undefined  	616
29936	  Alex	      615
62807	  Undefined 	608
64801	  Undefined	  600
24936	  Undefined	  585

-------

**Task 3 - Top 10: Users with highest charges, and daily distribution for each of them**
For that task I understood that I needed to find those people, who in fact talked the most to the people outside of *numbers* table on outgoing calls. So I've made a query filtering that users out - https://imgur.com/a/dLjexTE . 

So the answer should be:
user_id name        charged_total
46376	  Undefined	  9.40
6677	  Undefined  	9.08
4763	  Undefined  	7.76
98821	  Undefined  	7.52
63638	  Undefined  	7.40
16963  	Tom       	7.16
94076  	Undefined	  7.00
60889  	Undefined	  6.76
38210	  Olga	      6.56
50480	  Undefined  	6.52

I didn't understand how to make daily distribution, because all of the events in *call_logs* happened on the same day in span of something like 4 minutes 2019-03-07 17:36:52 to 2019-03-07 17:44:03.. I double checked amount of rows for errors, but either way there are 999 rows with that information overall.
