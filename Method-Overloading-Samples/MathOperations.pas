unit MathOperations;

interface

type
  // Custom record for 2D point
  TPoint2D = record
    X, Y: Double;
    constructor Create(aX, aY: Double);
    function ToString: string;
  end;

  // Custom class for complex number
  TComplexNumber = class
  private
    FReal, FImaginary: Double;
  public
    constructor Create(AReal, AImaginary: Double);
    function ToString: string;
    property Real: Double read FReal write FReal;
    property Imaginary: Double read FImaginary write FImaginary;
  end;

  TMathOperations = class
  public
    // Original overloaded Add methods
    function Add(a, b: Integer): Integer; overload;
    function Add(a, b: Double): Double; overload;
    function Add(a, b: string): string; overload;
    function Add(a: Integer; b: Double): Double; overload;
    
    // New overloaded methods for custom types
    function Add(a, b: TPoint2D): TPoint2D; overload;
    function Add(a: TComplexNumber; b: TComplexNumber): TComplexNumber; overload;
    function Add(a: TComplexNumber; b: Double): TComplexNumber; overload;
    
    // Other utility methods
    function IsEven(Number: Integer): Boolean;
    function CalculateAverage(Numbers: array of Double): Double;
    function Distance(Point1, Point2: TPoint2D): Double;
  end;

implementation

{ TPoint2D }

constructor TPoint2D.Create(aX, aY: Double);
begin
  X := aX;
  Y := aY;
end;

function TPoint2D.ToString: string;
begin
  Result := Format('(%.2f, %.2f)', [X, Y]);
end;

{ TComplexNumber }

constructor TComplexNumber.Create(AReal, AImaginary: Double);
begin
  inherited Create;
  FReal := AReal;
  FImaginary := AImaginary;
end;

function TComplexNumber.ToString: string;
begin
  if FImaginary >= 0 then
    Result := Format('%.2f + %.2fi', [FReal, FImaginary])
  else
    Result := Format('%.2f - %.2fi', [FReal, Abs(FImaginary)]);
end;

{ TMathOperations }

// Integer addition
function TMathOperations.Add(a, b: Integer): Integer;
begin
  Result := a + b;
end;

// Double addition
function TMathOperations.Add(a, b: Double): Double;
begin
  Result := a + b;
end;

// String concatenation
function TMathOperations.Add(a, b: string): string;
begin
  Result := a + b;
end;

// Mixed type addition (Integer + Double)
function TMathOperations.Add(a: Integer; b: Double): Double;
begin
  Result := a + b;
end;

// 2D Point addition
function TMathOperations.Add(a, b: TPoint2D): TPoint2D;
begin
  Result := TPoint2D.Create(a.X + b.X, a.Y + b.Y);
end;

// Complex number addition
function TMathOperations.Add(a, b: TComplexNumber): TComplexNumber;
begin
  Result := TComplexNumber.Create(a.Real + b.Real, a.Imaginary + b.Imaginary);
end;

// Complex number + Double addition
function TMathOperations.Add(a: TComplexNumber; b: Double): TComplexNumber;
begin
  Result := TComplexNumber.Create(a.Real + b, a.Imaginary);
end;

// Check if number is even
function TMathOperations.IsEven(Number: Integer): Boolean;
begin
  Result := (Number mod 2) = 0;
end;

// Calculate average of an array of doubles
function TMathOperations.CalculateAverage(Numbers: array of Double): Double;
var
  i: Integer;
  Sum: Double;
begin
  if Length(Numbers) = 0 then
  begin
    Result := 0;
    Exit;
  end;
  
  Sum := 0;
  for i := Low(Numbers) to High(Numbers) do
    Sum := Sum + Numbers[i];
    
  Result := Sum / Length(Numbers);
end;

// Calculate distance between two 2D points
function TMathOperations.Distance(Point1, Point2: TPoint2D): Double;
begin
  Result := Sqrt(Sqr(Point2.X - Point1.X) + Sqr(Point2.Y - Point1.Y));
end;

end.
