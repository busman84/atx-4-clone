## User Authentication

### Learning Objectives

* Provide a high-level explanation of what authentication is.
* Explain the difference between authentication and authorization.
* Describe some basic security measures for handling sensitive data, such as passwords.
* Explain the difference between encryption and hashing
* Use Devise to implement authentication

### Authentication vs Authorization

Authentication is the process of determining if someone is who they say they are. In web applications, authentication refers to users identifying themselves through a login procedure (e.g. email/password)

Authorization is determining whether they have access to a particular resource (e.g. roles)

### Security measures for handling sensitive data like passwords

* Use HTTPS for secure transmission of data
* Have a minimum and maximum password length, within reason
* Limit the number of successive login attempts per user (make them wait, or display Captcha)
* Never store passwords in plain text, store in a non-reversible hash form
* A side effect is that you can't recover passwords, you must reset them to new ones

Twitter high profile security breach
http://blog.codinghorror.com/dictionary-attacks-101/

* Hacker used dictionary attack to get into a high profile user's account - who happened to be an admin of Twitter
* Not only was he authenticated as this user, he was authorized to access other high profile user accounts like Barack Obama's, Fox News, etc


1st failed login |	no delay
-----------------|-----------
2nd failed login | 2 sec delay
3rd failed login | 4 sec delay
4th failed login | 8 sec delay
5th failed login | 16 sec delay

### Encryption

Encryption is the conversion of data into a form, called a ciphertext, that cannot be easily understood by unauthorized people. Encryption is reversible, there is always a method for getting the original input back

> Encryption could be viewed as a safe deposit box. Whatever you put in there comes back out, as long as you possess the key with which it was locked up in the first place. It's a symmetric operation. Given a key and some input, you get a certain output. Given that output, and the same key, you'll get back the original input. It's a 1:1 mapping.

### Hashing

Hashing is a one-way, data-destructive process, which takes an arbitrary-length string as input, and outputs a fixed-length string. Example:

* Input: "hello world"
* Output: "2aae6c35c94fcfb415dbe95f408b9ce91ee846ed"

> A hash function could be considered the same as baking a loaf of bread. You start out with inputs (flour, water, yeast, etc...) and after applying the hash function (mixing + baking), you end up with an output: a loaf of bread.

> Going the other way is extraordinarily difficult - you can't really separate the bread back into flour, water, yeast - some of that was lost during the baking process, and you can never tell exactly how much water or flour or yeast was used for a particular loaf, because that information was destroyed by the hashing function (aka the oven).

> Many different variants of inputs will theoretically produce identical loaves (e.g. 2 cups of water and 1 tsbp of yeast produce exactly the same loaf as 2.1 cups of water and 0.9tsbp of yeast), but given one of those loaves, you can't tell exactly what combo of inputs produced it.

### Bcrypt

Bcrypt is a popular algorithm used to hash passwords today. It uses a random salt that helps prevent rainbow table attacks to hash the password in a way that's not recoverable.

### Video

How NOT to store passwords

https://www.youtube.com/watch?v=8ZtInClXe1Q
