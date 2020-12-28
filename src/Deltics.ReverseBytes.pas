
{$i deltics.reversebytes.inc}

  unit Deltics.ReverseBytes;


interface

  function ReverseBytes(const aValue: Word): Word; overload;
  function ReverseBytes(const aValue: LongWord): LongWord; overload;
  function ReverseBytes(const aValue: Int64): Int64; overload;

  procedure ReverseBytes(aBuffer: System.PWord; const aCount: Integer); overload;
  procedure ReverseBytes(aBuffer: System.PCardinal; const aCount: Integer); overload;
  procedure ReverseBytes(aBuffer: System.PInt64; const aCount: Integer); overload;


implementation


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function ReverseBytes(const aValue: Word): Word;
  begin
    result :=  (((aValue and $ff00) shr 8)
             or ((aValue and $00ff) shl 8));
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function ReverseBytes(const aValue: LongWord): LongWord;
  begin
    result :=  (((aValue and $ff000000) shr 24)
            or  ((aValue and $00ff0000) shr 8)
            or  ((aValue and $0000ff00) shl 8)
            or  ((aValue and $000000ff) shl 24));
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  function ReverseBytes(const aValue: Int64): Int64;
  begin
    result :=  (((aValue and $ff00000000000000) shr 56)
            or  ((aValue and $00ff000000000000) shr 40)
            or  ((aValue and $0000ff0000000000) shr 24)
            or  ((aValue and $000000ff00000000) shr 8)
            or  ((aValue and $00000000ff000000) shl 8)
            or  ((aValue and $0000000000ff0000) shl 24)
            or  ((aValue and $000000000000ff00) shl 40)
            or  ((aValue and $00000000000000ff) shl 56));
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure ReverseBytes(      aBuffer: System.PWord;
                         const aCount: Integer);
  var
    i: Integer;
  begin
    for i := Pred(aCount) downto 0 do
    begin
      aBuffer^ :=  (((aBuffer^ and $ff00) shr 8)
                 or ((aBuffer^ and $00ff) shl 8));
      Inc(aBuffer);
    end;
  end;



  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure ReverseBytes(      aBuffer: System.PCardinal;
                         const aCount: Integer);
  var
    i: Integer;
  begin
    for i := Pred(aCount) downto 0 do
    begin
      aBuffer^ :=  (((aBuffer^ and $ff000000) shr 24)
                or  ((aBuffer^ and $00ff0000) shr 8)
                or  ((aBuffer^ and $0000ff00) shl 8)
                or  ((aBuffer^ and $000000ff) shl 24));

      Inc(aBuffer);
    end;
  end;


  { - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - }
  procedure ReverseBytes(      aBuffer: System.PInt64;
                         const aCount: Integer);
  var
    i: Integer;
  begin
    for i := Pred(aCount) downto 0 do
    begin
      aBuffer^ := (((aBuffer^ and $ff00000000000000) shr 56)
               or  ((aBuffer^ and $00ff000000000000) shr 40)
               or  ((aBuffer^ and $0000ff0000000000) shr 24)
               or  ((aBuffer^ and $000000ff00000000) shr 8)
               or  ((aBuffer^ and $00000000ff000000) shl 8)
               or  ((aBuffer^ and $0000000000ff0000) shl 24)
               or  ((aBuffer^ and $000000000000ff00) shl 40)
               or  ((aBuffer^ and $00000000000000ff) shl 56));

      Inc(aBuffer);
    end;
  end;




end.
