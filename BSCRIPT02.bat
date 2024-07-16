@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p shape=Enter your choice (1-3): 

if %shape%==1 goto circle
if %shape%==2 goto triangle
if %shape%==3 goto quadrilateral
echo Invalid choice. Please enter a number between 1 and 3.
pause
goto menu

:circle
set /p radius=Enter the radius: 
set /a area=314*%radius%*%radius%/100
echo The area of the circle is %area%.
goto end

:triangle
set /p a=Enter the length of side A: 
set /p b=Enter the length of side B: 
set /p c=Enter the length of side C: 

set /a s=(%a% + %b% + %c%) / 2
set /a area=%s% * (%s% - %a%) * (%s% - %b%) * (%s% - %c%)
set /a area=%area% ** 0.5

echo The area of the triangle is %area%.

if %a%==%b% if %b%==%c% (
    echo The triangle is equilateral.
) else if %a%==%b% if not %b%==%c% (
    echo The triangle is isosceles.
) else if not %a%==%b% if not %b%==%c% (
    echo The triangle is scalene.
)
goto end

:quadrilateral
set /p length=Enter the length: 
set /p width=Enter the width: 
set /a area=%length%*%width%
echo The area of the quadrilateral is %area%.

if %length%==%width% (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
goto end

:end
echo Script complete.
pause
