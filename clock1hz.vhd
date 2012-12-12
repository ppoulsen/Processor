ENTITY Clock1Hz IS
     PORT ( 
		reset: 	IN BIT;
		clk:	IN BIT;
		clock0:	OUT BIT;
		clock1:	OUT BIT;
		clock2:	OUT BIT;
		clock3:	OUT BIT
        );
END Clock1Hz;

ARCHITECTURE a OF Clock1Hz IS
BEGIN
PROCESS (reset, clk)
    VARIABLE cnt : INTEGER RANGE 0 TO 3;
BEGIN
    IF (reset = '1') THEN
        cnt := 0;
	ELSIF (clk'EVENT AND clk = '1') THEN
		IF (cnt = 0) THEN
           	clock0 <= '1';
           	clock2 <= '0';
           	clock1 <= '0';
           	clock3 <= '0';
			cnt := 1;
        ELSIF (cnt = 1) THEN
			clock1 <= '1';
           	clock2 <= '0';
           	clock0 <= '0';
           	clock3 <= '0';
			cnt := 2;
		ELSIF (cnt = 2) THEN
			clock2 <= '1';
           	clock0 <= '0';
           	clock1 <= '0';
           	clock3 <= '0';
			cnt := 3;
		ELSIF (cnt = 3) THEN
			clock3 <= '1';
           	clock0 <= '0';
           	clock1 <= '0';
           	clock2 <= '0';
			cnt := 0;
	    END IF;
	END IF;
END PROCESS;
END a;

