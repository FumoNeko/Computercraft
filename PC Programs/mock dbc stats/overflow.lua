--[[local mynum = UInt64(0x2b89dd1e, 0x3f91df0b)
3f91df0b2b89dd1e
so I'm guessing param1 is the lesser byte and param 2 is the greater byte
this must mean that value = 4580687535080594718 in decimal

bit.band(urByte, 2147483647)
 bit.band(urByte, 2147483648)
First one gives you the fake value
Or just
Fuck better idea
if urByte > 2147483647 then overflow occurred
ez

if bit.band(urByte, 2147483648) = 2147483648 then bit.bnot(bit.band(urByte, 2147483647)) + 1

  int main()
{
    printf("Value = %d; x1000 = %d", 32245642, 32245642 * 1000);

    return 0;
}


totalPrice / 2147483647 = overflowCounts
totalPrice % 2147483647 = priceAfterOverflow
if overflowCounts % 2 = 1 then priceAfterOverflow *= -1
]]
