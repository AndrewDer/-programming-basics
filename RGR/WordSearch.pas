UNIT WordSearch;
INTERFACE
CONST
  AlhabetEN = ['A'..'Z', 'a'..'z'];
  AlhabetRU = ['Ä'..'è', 'ê'..'ü', '†'..'Ø', '‡'..'Ô', '','Ò'];
  PROCEDURE GetWord(VAR FIn: TEXT; VAR FoundWord: STRING);
IMPLEMENTATION
  FUNCTION ReplaceChar(Ch: CHAR): CHAR;
  VAR
    TempCh: CHAR;
  BEGIN
    IF Ch IN ['Ä'..'è']
    THEN
      TempCh := CHR(ORD(Ch) + (ORD('†') - ORD('Ä')));
    IF Ch IN ['ê'..'ü']
    THEN
      TempCh := CHR(ORD(Ch) + (ORD('‡') - ORD('ê')));

    IF Ch IN ['A'..'Z']
    THEN
      TempCh:= CHR(ORD(Ch) + (ORD('a') - ORD('A')));
    IF Ch IN ['','Ò']
    THEN
      TempCh := '•';
    ReplaceChar := TempCh
  END;
  PROCEDURE GetWord(VAR FIn: TEXT; VAR FoundWord: STRING);
  VAR
    Ch: CHAR;
    Result: BOOLEAN;
  BEGIN
    FoundWord := '';
    Result := FALSE;
    WHILE (NOT EOLN(FIn)) AND (NOT Result)
    DO
      BEGIN
        READ(FIn, Ch);
        IF (Ch IN AlhabetEN) OR (Ch IN AlhabetRU)
        THEN
          BEGIN
            ReplaceChar(Ch);
            FoundWord := FoundWord + Ch
          END
        ELSE
          IF NOT (FoundWord = '')
          THEN
            Result := TRUE
      END
  END;
BEGIN
END.
