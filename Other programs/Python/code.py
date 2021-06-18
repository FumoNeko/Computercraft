from tkinter import *

window=Tk()
window.title("CalculatorForDBC")
window.geometry("900x370")
#This is the Text row, which I use to define the values I will be using in the GUI

l1=Label(window, text='Level:')
l1.grid(row=1, column=0)

l1=Label(window, text='STR=')
l1.grid(row=2, column=0)

l1=Label(window, text='DEX=')
l1.grid(row=3, column=0)

l1=Label(window, text='CON=')
l1.grid(row=4, column=0)

l1=Label(window, text='WIL=')
l1.grid(row=5, column=0)

l1=Label(window, text='MND=')
l1.grid(row=6, column=0)

l1=Label(window, text='SPI=')
l1.grid(row=7, column=0)

l1=Label(window, text='TP Cost:')
l1.grid(row=8, column=0)

l1=Label(window, text= "            ")
l1.grid(row=2, column=2)

l1=Label(window, text= "            ")
l1.grid(row=3, column=2)

l1=Label(window, text="Multipliers")
l1.grid(row=1, column=4)

l1=Label(window, text="Mlee DMG= STR x ")
l1.grid(row=2, column=3)

l1=Label(window, text="Blocking Defense= DEX x    ")
l1.grid(row=3, column=3)

l1=Label(window, text="Passive Defense= Blocking Defense %(0->50) ")
l1.grid(row=4, column=3)

l1=Label(window, text="HealthPoints= CON x")
l1.grid(row=5, column=3)

l1=Label(window, text="ActionTime(Stamina)= CON x")
l1.grid(row=6, column=3)

l1=Label(window, text="Ki Power= WIL x")
l1.grid(row=7, column=3)

l1=Label(window, text="Max Ki= SPI x ")
l1.grid(row=8, column=3)

l1=Label(window, text=" ")
l1.grid(row=10, column=1)

l1=Label(window, text=" ")
l1.grid(row=11, column=1)

l1=Label(window, text="How much you punch(excluding stam. regen)")
l1.grid(row=12, column=1)

l1=Label(window, text="Mlee DMG and ActionTime required")
l1.grid(row=13, column=1)

l1=Label(window, text="=")
l1.grid(row=2,column=5)

l1=Label(window, text="=")
l1.grid(row=3, column=5)

l1=Label(window, text="=")
l1.grid(row=4, column=5)

l1=Label(window, text="=")
l1.grid(row=5, column=5)

l1=Label(window, text="=")
l1.grid(row=6, column=5)

l1=Label(window, text="=")
l1.grid(row=7, column=5)

l1=Label(window, text="=")
l1.grid(row=8, column=5)

#This is the variables, functions row, wich is where I will define my functions and add variables
STR = IntVar()
STR.set( STR.get())
DEX = IntVar()
DEX.set( DEX.get())
CON = IntVar()
CON.set( CON.get())
WIL = IntVar()
WIL.set ( WIL.get())
MND = IntVar()
MND.set( MND.get())
SPI = IntVar()
SPI.set( SPI.get())
tpcost= IntVar()
DMG= IntVar()
DMG.set( DMG.get())


def cal():
    global tpcost
    global i
    i= int(u1.get()) + int(u2.get()) + int(u3.get()) + int(u4.get()) + int(u5.get()) + int(u6.get())
    tpcost= i * 1.6
    print(tpcost)
    b1.config(text=int(tpcost))

def level():
    global lev
    lev= ((int(u1.get()) + int(u2.get()) + int(u3.get()) + int(u4.get()) + int(u5.get()) + int(u6.get()))) / 5 - 11
    print (lev)
    b2.config(text=int(lev))

def DMG():
    global d
    d= (int(u1.get())) * ((float(dm.get())))
    print (d)
    b3.config(text=int(d))

def DEF():
    global df
    df= (int(u2.get())) * ((float(dem.get())))
    print(df)
    b4.config(text=int(df))
def pDEF():
    global pdf
    pdf= (((int(u2.get())) * ((float(dem.get())))) * (int(Pd.get()))) / 100.0 - 1
    print(pdf)
    b5.config(text=int(pdf))
def HealthP():
    global Hp
    Hp= (int(u3.get())) * (float(hp.get()))
    print(Hp)
    b6.config(text=int(Hp))
def ActionTime():
    global aT
    aT= (((int(u3.get())) * ((float(at.get())))))
    print(aT)
    b7.config(text=int(aT))
def KiPower():
    global kP
    kP= (int(u4.get())) * (float(kp.get()))
    print(kp)
    b8.config(text=int(kP))
def MaxKi():
    global mK
    mK= (int(u6.get())) * (float(mk.get()))
    print(mK)
    b9.config(text=int(mK))
def PunchNr():
    global pN
    pN= ((int(u1.get())) * ((float(dm.get())))) / (((((int(u3.get())) * ((float(at.get())))))) / 10)
    b10.config(text=int(pN))
#This is the Value/Writeable/Button Row, wich is where you input your value
u1=Entry(window, textvariable= STR)
u1.grid(row=2, column=1)

u2=Entry(window, textvariable= DEX)
u2.grid(row=3, column=1)

u3=Entry(window, textvariable= CON)
u3.grid(row=4, column=1)

u4=Entry(window, textvariable= WIL)
u4.grid(row=5, column=1)

u5=Entry(window, textvariable= MND)
u5.grid(row=6, column=1)

u6=Entry(window, textvariable= SPI)
u6.grid(row=7, column=1)

dm= Entry(window)
dm.grid(row=2, column=4)

dem=Entry(window)
dem.grid(row=3, column=4)

Pd=Entry(window)
Pd.grid(row=4, column=4)

hp=Entry(window)
hp.grid(row=5, column=4)

at=Entry(window)
at.grid(row=6, column=4)

kp=Entry(window)
kp.grid(row=7, column=4)

mk=Entry(window)
mk.grid(row=8, column=4)

#Where the Buttons begin
b1 = Button(window, text="Calculate", command=cal)
b1.grid(row=8, column=1)

b2 = Button(window, text="Calculate", command=level)
b2.grid(row=1, column=1)

b3= Button(window, text="Calculate DMG", command=DMG)
b3.grid(row=2, column=6)

b4= Button(window, text="Calculate DEF", command=DEF)
b4.grid(row=3, column=6)

b5= Button(window, text="Calculate Passive DEF", command=pDEF)
b5.grid(row=4, column=6)

b6= Button(window, text="Calculate HealthPoints", command=HealthP)
b6.grid(row=5, column=6)

b7= Button(window, text="Calculate ActionTime", command=ActionTime)
b7.grid(row=6, column=6)

b8= Button(window, text="Calculate KiPower", command=KiPower)
b8.grid(row=7, column=6)

b9= Button(window, text="Calculate MaxKi", command=MaxKi)
b9.grid(row=8, column=6)

b10= Button(window, text="Calculate", command=PunchNr)
b10.grid(row=14, column=1)
#Where the Buttons end

window.mainloop()
