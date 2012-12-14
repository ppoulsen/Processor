ENTITY Clock1Hz IS
     PORT ( 
		reset: 	IN BIT;
		clk:	IN BIT;
		clock0:	OUT BIT;
		clock1:	OUT BIT;
		clock2:	OUT BIT;
		clock3:	OUT BIT;
		clock4:	OUT BIT;
		clock5: OUT BIT;
		clock6: OUT BIT;
		clock7: OUT BIT
        );
END Clock1Hz;

ARCHITECTURE a OF Clock1Hz IS
BEGIN
PROCESS (reset, clk)
	VARIABLE big_count : INTEGER RANGE 0 TO 12000;
    VARIABLE cnt : INTEGER RANGE 0 TO 7;
BEGIN
    IF (reset = '1') THEN
        cnt := 0;
	ELSIF (clk'EVENT AND clk = '1') THEN
		IF(big_count = 12000) THEN
			big_count := 0;
			IF (cnt = 0) THEN
				clock0 <= '1';
				clock2 <= '0';
				clock1 <= '0';
				clock3 <= '0';
				clock4 <= '0';
				clock5 <= '0';
				cnt := 1;
			ELSIF (cnt = 1) THEN
				clock1 <= '1';
				clock2 <= '0';
				clock0 <= '0';
				clock3 <= '0';
				clock4 <= '0';
				clock5 <= '0';
				cnt := 2;
			ELSIF (cnt = 2) THEN
				clock2 <= '1';
				clock0 <= '0';
				clock1 <= '0';
				clock3 <= '0';
				clock4 <= '0';
				clock5 <= '0';
				cnt := 3;
			ELSIF (cnt = 3) THEN
				clock3 <= '1';
				clock0 <= '0';
				clock1 <= '0';
				clock2 <= '0';
				clock4 <= '0';
				clock5 <= '0';
				cnt := 4;
			ELSIF (cnt = 4) THEN
				clock3 <= '0';
				clock0 <= '0';
				clock1 <= '0';
				clock2 <= '0';
				clock4 <= '1';
				clock5 <= '0';
				cnt := 5;
			ELSIF (cnt = 5) THEN
				clock3 <= '0';
				clock0 <= '0';
				clock1 <= '0';
				clock2 <= '0';
				clock4 <= '0';
				clock5 <= '1';
				cnt := 6;
			ELSIF (cnt = 6) THEN
				clock3 <= '0';
				clock0 <= '0';
				clock1 <= '0';
				clock2 <= '0';
				clock4 <= '0';
				clock5 <= '0';
				clock6 <= '1';
				clock7 <= '0';
				cnt := 7;
			ELSIF (cnt = 7) THEN
				clock3 <= '0';
				clock0 <= '0';
				clock1 <= '0';
				clock2 <= '0';
				clock4 <= '0';
				clock5 <= '0';
				clock6 <= '0';
				clock7 <= '1';
				cnt := 0;
			END IF;
		ELSE
			big_count := big_count + 1;
		END IF;
	END IF;
END PROCESS;
END a;

