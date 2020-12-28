
{$T+}

  unit Tests;


interface

  uses
    Deltics.Smoketest;


  type
    TTests = class(TTest)
      procedure ReverseBytesOverAWordReturnsAWordWithBytesSwapped;
      procedure ReverseBytesOverALongWordReturnsALongWordWithBytesSwapped;
      procedure ReverseBytesOverAnInt64ReturnsAnInt64WithBytesSwapped;
      procedure ReverseBytesOverAWordBufferReversesBytesInPlaceOn2ByteBoundaries;
      procedure ReverseBytesOverALongWordBufferReversesBytesInPlaceOn4ByteBoundaries;
      procedure ReverseBytesOverAnInt64BufferReversesBytesInPlaceOn8ByteBoundaries;
    end;


implementation

  uses
    Deltics.ReverseBytes;


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


  procedure TTests.ReverseBytesOverAWordBufferReversesBytesInPlaceOn2ByteBoundaries;
  const
    ORIGINAL = $0102;
    REVERSED = $0201;
  var
    v: array[1..4] of Word;
    i: Integer;
  begin
    for i := 1 to 4 do
      v[i] := ORIGINAL;

    ReverseBytes(@v[1], Length(v));

    for i := 1 to 4 do
      Test('v[{i:%d}]', [i]).Assert(v[i]).Equals(REVERSED);
  end;


  procedure TTests.ReverseBytesOverALongWordBufferReversesBytesInPlaceOn4ByteBoundaries;
  const
    ORIGINAL = $01020304;
    REVERSED = $04030201;
  var
    v: array[1..4] of LongWord;
    i: Integer;
  begin
    for i := 1 to 4 do
      v[i] := ORIGINAL;

    ReverseBytes(@v[1], Length(v));

    for i := 1 to 4 do
      Test('v[{i:%d}]', [i]).Assert(v[i]).Equals(REVERSED);
  end;


  procedure TTests.ReverseBytesOverAnInt64BufferReversesBytesInPlaceOn8ByteBoundaries;
  const
    ORIGINAL = $0102030405060708;
    REVERSED = $0807060504030201;
  var
    v: array[1..4] of Int64;
    i: Integer;
  begin
    for i := 1 to 4 do
      v[i] := ORIGINAL;

    ReverseBytes(@v[1], Length(v));

    for i := 1 to 4 do
      Test('v[{i:%d}]', [i]).Assert(v[i]).Equals(REVERSED);
  end;



end.
