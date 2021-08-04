# doubleclickmacro

I have been noticing that windows defender flags this file due to the file not having a proper signature.
https://www.virustotal.com/gui/file/ca87ea61aba62bcf818cc67041952e677b0b7c490c0f87d2618d82184aca312c/detection

I have created this for people to fake having a double clicking mouse.

![image](https://user-images.githubusercontent.com/76220359/112241043-e2b01f00-8c1f-11eb-99fa-e1dd14ded37e.png)

Tips:

If you are not getting many double clicks, try increasing the register value from 0.12 to 0.15 and so on.

Similarly, if you have to hold the mouse button for too long in order for it to register as a hold, try lowering it to 0.11.

These settings vary depending on mouse model and input lag.

The randomizer by default runs a random number from 1 to 3, where if the number is 1 or 2, you get a double click. And vice versa for single clicks.

You can adjust this to your preference. (Default is 66% chance.)

The CPS cap depends on your RAW clicks (Physical clicks)

After reaching the cap, your clicks are sent normally until you get under the cap again.

A cap of 8 will likely result at 12 to 15 cps.

**Disclaimer: This program is designed for use with mice that do not double click. I am not responsible for any consequences caused by using the macro.**
