unit GlobalVars;

interface

var
  GlobalInt: Integer = 42;
  GlobalStr: string = 'Global String';
  GlobalDouble: Double = 3.14;

implementation

var
  UnitLocalInt: Integer = 100;

procedure UseUnitLocal;
begin
  WriteLn(UnitLocalInt);
end;

end.
