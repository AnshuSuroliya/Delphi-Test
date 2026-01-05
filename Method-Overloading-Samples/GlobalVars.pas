unit GlobalVars;

interface

var
  GlobalInt: Integer = 42;
  GlobalStr: string = 'Global String';
  GlobalDouble: Double = 3.14;
  GlobalBool: Boolean = True;
  GlobalChar: Char = 'A';
  GlobalAddend1: Integer = 5;
  GlobalAddend2: Integer = 15;

implementation

var
  UnitLocalInt: Integer = 100;

procedure UseUnitLocal;
begin
  WriteLn(UnitLocalInt);
end;

end.
