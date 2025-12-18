unit GlobalConsumer;

interface

uses
  GlobalVars;

procedure ConsumeGlobals;

type
  TDemoClass = class
  private
    FClassField: Integer;
  public
    procedure ConsumeField;
  end;

implementation

procedure ConsumeGlobals;
var
  LocalVal: Integer;
begin
  // Direct usage of global from interface of another unit
  LocalVal := GlobalInt + 10;
  
  // Usage as argument
  WriteLn(GlobalStr);
  
  // Usage in calculation
  if GlobalDouble > 2.0 then
    WriteLn('Large double');
end;

{ TDemoClass }

procedure TDemoClass.ConsumeField;
begin
  // Usage of class field (declared in interface class definition)
  FClassField := FClassField + 1;
  WriteLn(FClassField);
end;

end.
