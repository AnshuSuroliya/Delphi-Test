unit MathDemoUnit;

interface

uses
  SysUtils,
  MathOperations,
  ComplexNumberFactory;

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
  point1, point2, pointSum: TPoint2D;
  complex1, complex2, complexSum: TComplexNumber;
begin
  Math := TMathOperations.Create;
  intResult := Math.Add(10, 20);
  WriteLn('First demonstration:');
  WriteLn('10 + 20 = ', intResult);
  dblResult := Math.Add(15.75, 25.25);
  strResult := Math.Add('Hello, ', 'Delphi!');
  WriteLn(strResult);
  WriteLn(#13#10'Second demonstration:');
  dblResult := Math.Add(10, 15.5);
  WriteLn('Is 7 even? ', Math.IsEven(7));
  WriteLn('Is 8 even? ', Math.IsEven(8));
  WriteLn(#13#10'Third demonstration:');
  avgResult := Math.CalculateAverage(numbers);
  WriteLn(#13#10'Fourth demonstration:');
  WriteLn('5 + 3 = ', Math.Add(5, 3));
  Math.Free;
  
  WriteLn(#13#10'--- Working with Custom Objects ---');
  complex1 := TComplexNumber.Create(2, 3);
  complex2 := TComplexNumber.Create(1, -2);
  WriteLn(#13#10'Complex Number Addition (created in same unit):');
  complexSum := Math.Add(complex1, complex2);
  WriteLn(Format('%s + %s = %s', [complex1.ToString, complex2.ToString, complexSum.ToString]));
  complex1.Free;
  complex2.Free;
  complexSum.Free;
  
  complex1 := CreateComplexNumber(4, 5);
  complex2 := CreateComplexNumber(2, -1);
  WriteLn(#13#10'Complex Number Addition (created in another unit):');
  complexSum := Math.Add(complex1, complex2);
  WriteLn(Format('%s + %s = %s', [complex1.ToString, complex2.ToString, complexSum.ToString]));
  WriteLn(#13#10'Complex + Double Addition (from another unit):');
  complexSum := Math.Add(complex1, 2.5);
  WriteLn(Format('%s + 2.5 = %s', [complex1.ToString, complexSum.ToString]));
  complex1.Free;
  complex2.Free;
  complexSum.Free;
  
  point1 := TPoint2D.Create(1.5, 2.5);
  point2 := TPoint2D.Create(3.5, 4.5);
  pointSum := Math.Add(point1, point2);
  WriteLn(#13#10'2D Point Addition:');
  WriteLn(Format('%s + %s = %s', [point1.ToString, point2.ToString, pointSum.ToString]));
  
  complex1 := TComplexNumber.Create(2, 3);
  complex2 := TComplexNumber.Create(1, -2);
  WriteLn(#13#10'Complex Number Addition:');
  complexSum := Math.Add(complex1, complex2);
  WriteLn(Format('%s + %s = %s', [complex1.ToString, complex2.ToString, complexSum.ToString]));
  WriteLn(#13#10'Complex + Double Addition:');
  complexSum := Math.Add(complex1, 5.5);
  WriteLn(Format('%s + 5.5 = %s', [complex1.ToString, complexSum.ToString]));
  complex1.Free;
  complex2.Free;
  complexSum.Free;
  
  WriteLn(#13#10'Press Enter to exit...');
  ReadLn;
end;

end.