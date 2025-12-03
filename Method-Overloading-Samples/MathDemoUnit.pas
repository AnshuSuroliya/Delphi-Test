unit MathDemoUnit;

interface

uses
  SysUtils,
  MathOperations,
  ComplexNumberFactory;  // For CreateComplexNumber

procedure RunMathDemo;

implementation

procedure RunMathDemo;
var
  Math: TMathOperations;
  intResult: Integer;
  dblResult: Double;
  strResult: string;
  avgResult: Double;
  numbers: array[0..4] of Double = (10.5, 20.3, 30.7, 40.1, 50.9);
  
  // Variables for custom objects
  point1, point2, pointSum: TPoint2D;
  complex1, complex2, complexSum: TComplexNumber;
begin
  Math := TMathOperations.Create;
  try
    // First demonstration of overloaded methods
    intResult := Math.Add(10, 20);
    WriteLn('First demonstration:');
    WriteLn('10 + 20 = ', intResult);
    
    dblResult := Math.Add(15.75, 25.25);
    WriteLn('15.75 + 25.25 = ', dblResult:0:2);
    
    strResult := Math.Add('Hello, ', 'Delphi!');
    WriteLn(strResult);
    
    // Second demonstration with different parameters
    WriteLn(#13#10'Second demonstration:');
    dblResult := Math.Add(10, 15.5);
    WriteLn('10 + 15.5 = ', dblResult:0:2);
    
    // Using other utility methods
    WriteLn('Is 7 even? ', Math.IsEven(7));
    WriteLn('Is 8 even? ', Math.IsEven(8));
    
    // Third demonstration with array
    WriteLn(#13#10'Third demonstration:');
    avgResult := Math.CalculateAverage(numbers);
    WriteLn('Average of numbers: ', avgResult:0:2);
    
    // Fourth demonstration of overloaded methods
    WriteLn(#13#10'Fourth demonstration:');
    WriteLn('5 + 3 = ', Math.Add(5, 3));
    WriteLn('5.5 + 3.5 = ', Math.Add(5.5, 3.5):0:2);
    
  finally
    Math.Free;
  end;
  
  // Demo with custom objects
  WriteLn(#13#10'--- Working with Custom Objects ---');
  
  // Example 1: Complex numbers created in this unit
  complex1 := TComplexNumber.Create(2, 3);  // 2 + 3i
  complex2 := TComplexNumber.Create(1, -2); // 1 - 2i
  try
    WriteLn(#13#10'Complex Number Addition (created in same unit):');
    complexSum := Math.Add(complex1, complex2);
    WriteLn(Format('%s + %s = %s', [complex1.ToString, complex2.ToString, complexSum.ToString]));
  finally
    complex1.Free;
    complex2.Free;
    complexSum.Free;
  end;
  
  // Example 2: Complex numbers created in another unit
  complex1 := CreateComplexNumber(4, 5);    // 4 + 5i
  complex2 := CreateComplexNumber(2, -1);   // 2 - i
  try
    WriteLn(#13#10'Complex Number Addition (created in another unit):');
    complexSum := Math.Add(complex1, complex2);
    WriteLn(Format('%s + %s = %s', [complex1.ToString, complex2.ToString, complexSum.ToString]));
    
    // Example of adding complex number with a double
    WriteLn(#13#10'Complex + Double Addition (from another unit):');
    complexSum := Math.Add(complex1, 2.5);
    WriteLn(Format('%s + 2.5 = %s', [complex1.ToString, complexSum.ToString]));
  finally
    complex1.Free;
    complex2.Free;
    complexSum.Free;
  end;
  
  // 2D Points demo
  point1 := TPoint2D.Create(1.5, 2.5);
  point2 := TPoint2D.Create(3.5, 4.5);
  pointSum := Math.Add(point1, point2);
  WriteLn(#13#10'2D Point Addition:');
  WriteLn(Format('%s + %s = %s', [point1.ToString, point2.ToString, pointSum.ToString]));
  WriteLn(Format('Distance between points: %.2f', [Math.Distance(point1, point2)]));
  
  // Complex Numbers demo
  complex1 := TComplexNumber.Create(2, 3);  // 2 + 3i
  complex2 := TComplexNumber.Create(1, -2); // 1 - 2i
  
  WriteLn(#13#10'Complex Number Addition:');
  complexSum := Math.Add(complex1, complex2);
  WriteLn(Format('%s + %s = %s', [complex1.ToString, complex2.ToString, complexSum.ToString]));
  
  WriteLn(#13#10'Complex + Double Addition:');
  complexSum := Math.Add(complex1, 5.5);
  WriteLn(Format('%s + 5.5 = %s', [complex1.ToString, complexSum.ToString]));
  
  // Clean up complex number objects
  complex1.Free;
  complex2.Free;
  complexSum.Free;
  
  WriteLn(#13#10'Press Enter to exit...');
  ReadLn;
end;

end.
