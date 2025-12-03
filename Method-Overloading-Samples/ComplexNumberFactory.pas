unit ComplexNumberFactory;

interface

uses
  MathOperations;  // For TComplexNumber

function CreateComplexNumber(AReal, AImaginary: Double): TComplexNumber;

implementation

function CreateComplexNumber(AReal, AImaginary: Double): TComplexNumber;
begin
  Result := TComplexNumber.Create(AReal, AImaginary);
end;

end.
