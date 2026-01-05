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

  TMathOperations = class  // ← MOVED HERE
  public
    function Addition(a, b: Integer): Integer; overload;
  end;

implementation

procedure ConsumeGlobals;
var
  LocalVal: Integer;
begin
  LocalVal := GlobalInt + 10;
  WriteLn(GlobalStr);
  if GlobalDouble > 2.0 then
    WriteLn('Large double');
  WriteLn('Boolean value: ', GlobalBool);
  WriteLn('Character value: ', GlobalChar);
end;

{ TDemoClass }

procedure TDemoClass.ConsumeField;
var
  Math: TMathOperations;
  intResult: Integer;
begin
  FClassField := FClassField + 1;
  Math := TMathOperations.Create;
  intResult := Math.Addition(10, GlobalInt);
  WriteLn(intResult);
  Math.Free;
end;

{ TMathOperations }

function TMathOperations.Addition(a, b: Integer): Integer;
begin
  Result := a + b;
end;

end.