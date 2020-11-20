
{$define CONSOLE}

{$i deltics.inc}

  program test;

uses
  Deltics.Smoketest,
  Deltics.ReverseBytes in '..\src\Deltics.ReverseBytes.pas';

type
    TTests = class(TTest)
      procedure ReverseBytesOverAWordReturnsAWordWithBytesSwapped;
      procedure ReverseBytesOverALongWordReturnsALongWordWithBytesSwapped;
      procedure ReverseBytesOverAnInt64ReturnsAnInt64WithBytesSwapped;
    end;



  procedure TTests.ReverseBytesOverALongWordReturnsALongWordWithBytesSwapped;
  var
    v: Integer;
  begin
    v := ReverseBytes($01020304);

    Test('result').Assert(v).Equals($04030201);
  end;


  procedure TTests.ReverseBytesOverAnInt64ReturnsAnInt64WithBytesSwapped;
  var
    v: Int64;
  begin
    v := ReverseBytes($0102030405060708);

    Test('result').Assert(v).Equals($0807060504030201);
  end;


  procedure TTests.ReverseBytesOverAWordReturnsAWordWithBytesSwapped;
  var
    v: Word;
  begin
    v := ReverseBytes($0102);

    Test('result').Assert(v).Equals($0201);
  end;




begin
  TestRun.Test(TTests);
end.
