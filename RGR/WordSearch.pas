UNIT WordSearch;
INTERFACE
CONST
  Alhabet = ['A'..'Z', 'a'..'z', 'Ä'..'è', 'ê'..'ü', '†'..'Ø', '‡'..'Ô', '','Ò'];
  PROCEDURE GetWord(VAR FIn: TEXT; VAR FoundWord: STRING);
IMPLEMENTATION
  FUNCTION ReplaceChar(Ch: CHAR): CHAR;
  BEGIN
    IF Ch IN ['Ä'..'è']
    THEN
      Ch := CHR(ORD(Ch) + (ORD('†') - ORD('Ä')));
    IF Ch IN ['ê'..'ü']
    THEN
      Ch := CHR(ORD(Ch) + (ORD('‡') - ORD('ê')));
    IF Ch IN ['A'..'Z']
    THEN
      Ch:= CHR(ORD(Ch) + (ORD('a') - ORD('A')));
    IF Ch IN ['','Ò']
    THEN
      Ch := '•';
    ReplaceChar := Ch
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
        IF (Ch IN Alhabet)
        THEN
            FoundWord := FoundWord + ReplaceChar(Ch)
        ELSE
          IF NOT (FoundWord = '')
          THEN
            Result := TRUE
      END
  END;
BEGIN
END.
