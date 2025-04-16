Bonus Section:

1. What is PostgreSQL? <br/>
 Ans: PostgreSQL একটি শক্তিশালী ও ওপেন-সোর্স রিলেশনাল ডেটাবেজ সিস্টেম। 

2. What is the purpose of a database schema in PostgreSQL?
 Ans: টেবিল, ফাংশনসহ ডেটা গুছিয়ে রাখতে Schema সাহায্য করে।

3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Ans: 
 - Primary Key: এটি একটি টেবিলের এমন একটি কলাম যা প্রতিটি রেকর্ডের জন্য ইউনিক ও অপরিবর্তনযোগ্য (NOT NULL) হয়। যেমন, ছাত্র আইডি।

 - Foreign Key: এটি অন্য একটি টেবিলের প্রাইমারি কি’র সাথে সংযুক্ত থাকে, এবং টেবিলের মধ্যে সম্পর্ক (relationship) তৈরি করতে সাহায্য করে। এটি ডেটার ইন্টিগ্রিটি নিশ্চিত করে।

4. What is the difference between the VARCHAR and CHAR data types?
 Ans:
  - VARCHAR(n): এটি পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং। যেমন, "Hello" দিলে শুধু ৫ বাইট ব্যবহার হবে।

  - CHAR(n): এটি নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং, সবসময় ঠিক n ক্যারেক্টার সংরক্ষণ করে, অতিরিক্ত জায়গা ফাঁকা স্পেস দিয়ে পূরণ করে।

5. Explain the purpose of the WHERE clause in a SELECT statement.
 Ans: 
  - WHERE ক্লজ ব্যবহার করে ডেটাবেজ থেকে নির্দিষ্ট শর্ত অনুযায়ী ডেটা ফিল্টার করা হয়। যেমন, “age > 18” দিয়ে শুধু প্রাপ্তবয়স্কদের রেকর্ড দেখানো যায়।

6. What are the LIMIT and OFFSET clauses used for?
 Ans:
  - LIMIT: কতগুলো রেকর্ড ফেরত দিতে হবে, তা নির্ধারণ করে।

  - OFFSET: কতগুলো রেকর্ড স্কিপ করে শুরু করতে হবে, তা বলে।
এটি সাধারণত pagination বা পাতার ভিত্তিতে ডেটা দেখানোর সময় ব্যবহৃত হয়।

7. How can you modify data using UPDATE statements?
 Ans:
 - UPDATE কমান্ড দিয়ে একটি টেবিলের নির্দিষ্ট রেকর্ডের ডেটা পরিবর্তন করা যায়। 
  উদাহরণ:
   UPDATE table_name
    SET column_name = value
    WHERE condition;

8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
 Ans: JOIN ব্যবহার করে একাধিক টেবিলকে তাদের কমন কলামের উপর ভিত্তি করে একত্রে আনা যায়। যেমন, students ও marks টেবিলকে student_id দিয়ে যুক্ত করে প্রতিটি ছাত্রের নাম ও নম্বর একসাথে দেখা যায়।

9. Explain the GROUP BY clause and its role in aggregation operations.
 Ans:GROUP BY ডেটাগুলোকে একটি নির্দিষ্ট কলামের ভিত্তিতে গ্রুপ করে। এটি সাধারণত অ্যাগ্রিগেট ফাংশনের (COUNT, SUM) সাথে ব্যবহার করা হয়, যাতে প্রতিটি গ্রুপের উপর ভিত্তি করে হিসাব করা যায়।

10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
 Ans: 
  - COUNT(): মোট কয়টি রেকর্ড আছে তা গণনা করে।

  - SUM(): নির্দিষ্ট কলামের সব মান যোগ করে।

  - AVG(): একটি কলামের গড় বের করে।
   উদাহরণ:
    SELECT COUNT(*) FROM books;
    SELECT SUM(price) FROM books;
    SELECT AVG(price) FROM books;

MST.Setu AKther 