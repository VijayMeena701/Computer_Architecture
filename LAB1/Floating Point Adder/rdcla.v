module rdcla(a, b, cin, sum, cout);
	input [32:1] a,b;
	input cin;
	
	output wire [32:1] sum;
	output wire cout;

	wire [1:0] kgp [32:1];
	
	wire [1:0] temp_1 [32:1];
	wire [1:0] temp_2 [32:1];
	wire [1:0] temp_4 [32:1];
	wire [1:0] temp_8 [32:1];
	wire [1:0] temp_16 [32:1];

	wire [32:1] kg;

//kgp -- 00-kill && 11-generate && 10-propagate

	
//KGP Generating
assign kgp[1][0]=(a[1]&b[1]) | (b[1]&cin) | (cin&a[1]);
assign kgp[1][1]=(a[1]&b[1]) | (b[1]&cin) | (cin&a[1]);

assign kgp[2][0]=a[2]&b[2]; 
assign kgp[2][1]=a[2]|b[2];

assign kgp[3][0]=a[3]&b[3]; 
assign kgp[3][1]=a[3]|b[3];

assign kgp[4][0]=a[4]&b[4]; 
assign kgp[4][1]=a[4]|b[4];

assign kgp[5][0]=a[5]&b[5]; 
assign kgp[5][1]=a[5]|b[5];

assign kgp[6][0]=a[6]&b[6]; 
assign kgp[6][1]=a[6]|b[6];

assign kgp[7][0]=a[7]&b[7]; 
assign kgp[7][1]=a[7]|b[7];

assign kgp[8][0]=a[8]&b[8]; 
assign kgp[8][1]=a[8]|b[8];

assign kgp[9][0]=a[9]&b[9]; 
assign kgp[9][1]=a[9]|b[9];

assign kgp[10][0]=a[10]&b[10]; 
assign kgp[10][1]=a[10]|b[10];

assign kgp[11][0]=a[11]&b[11]; 
assign kgp[11][1]=a[11]|b[11];

assign kgp[12][0]=a[12]&b[12]; 
assign kgp[12][1]=a[12]|b[12];

assign kgp[13][0]=a[13]&b[13]; 
assign kgp[13][1]=a[13]|b[13];

assign kgp[14][0]=a[14]&b[14]; 
assign kgp[14][1]=a[14]|b[14];

assign kgp[15][0]=a[15]&b[15]; 
assign kgp[15][1]=a[15]|b[15];

assign kgp[16][0]=a[16]&b[16]; 
assign kgp[16][1]=a[16]|b[16];

assign kgp[17][0]=a[17]&b[17]; 
assign kgp[17][1]=a[17]|b[17];

assign kgp[18][0]=a[18]&b[18]; 
assign kgp[18][1]=a[18]|b[18];

assign kgp[19][0]=a[19]&b[19]; 
assign kgp[19][1]=a[19]|b[19];

assign kgp[20][0]=a[20]&b[20]; 
assign kgp[20][1]=a[20]|b[20];

assign kgp[21][0]=a[21]&b[21]; 
assign kgp[21][1]=a[21]|b[21];

assign kgp[22][0]=a[22]&b[22]; 
assign kgp[22][1]=a[22]|b[22];

assign kgp[23][0]=a[23]&b[23]; 
assign kgp[23][1]=a[23]|b[23];

assign kgp[24][0]=a[24]&b[24]; 
assign kgp[24][1]=a[24]|b[24];

assign kgp[25][0]=a[25]&b[25]; 
assign kgp[25][1]=a[25]|b[25];

assign kgp[26][0]=a[26]&b[26]; 
assign kgp[26][1]=a[26]|b[26];

assign kgp[27][0]=a[27]&b[27]; 
assign kgp[27][1]=a[27]|b[27];

assign kgp[28][0]=a[28]&b[28]; 
assign kgp[28][1]=a[28]|b[28];

assign kgp[29][0]=a[29]&b[29]; 
assign kgp[29][1]=a[29]|b[29];

assign kgp[30][0]=a[30]&b[30]; 
assign kgp[30][1]=a[30]|b[30];

assign kgp[31][0]=a[31]&b[31]; 
assign kgp[31][1]=a[31]|b[31];

assign kgp[32][0]=a[32]&b[32]; 
assign kgp[32][1]=a[32]|b[32];

//KGP Reducing
// 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1
// 1 -32.31 ..... 16.15  15.14  14.13  13.12  12.11  11.10  10.9  9.8  8.7  7.6  6.5  5.4  4.3  3.2  2.1  1
// 2 -32.30 ..... 16.14  15.13  14.12  13.11  12.10  11.9  10.8  9.7  8.6  7.5  6.4  5.3  4.2  3.1  2  1
// 4 -32.28 ..... 16.12  15.11  14.10  13.9  12.8  11.7  10.6  9.5  8.4  7.3  6.2  5.1  4  3  2  1
// 8 -32.24 ..... 16.8  15.7  14.6  13.5  12.4  11.3  10.2  9.1  8  7  6  5  4  3  2  1
// 16- 
// 32-NIL


// 1 - 32.31 ..... 16.15  15.14  14.13  13.12  12.11  11.10  10.9  9.8  8.7  7.6  6.5  5.4  4.3  3.2  2.1  1

assign temp_1[1][0]=kgp[1][0];
assign temp_1[1][1]=kgp[1][1];

assign temp_1[2][0]=(kgp[2][0])|(kgp[2][1]&kgp[1][0]);
assign temp_1[2][1]=(kgp[2][0])|(kgp[2][1]&kgp[1][1]);

assign temp_1[3][0]=(kgp[3][0])|(kgp[3][1]&kgp[2][0]);
assign temp_1[3][1]=(kgp[3][0])|(kgp[3][1]&kgp[2][1]);

assign temp_1[4][0]=(kgp[4][0])|(kgp[4][1]&kgp[3][0]);
assign temp_1[4][1]=(kgp[4][0])|(kgp[4][1]&kgp[3][1]);

assign temp_1[5][0]=(kgp[5][0])|(kgp[5][1]&kgp[4][0]);
assign temp_1[5][1]=(kgp[5][0])|(kgp[5][1]&kgp[4][1]);

assign temp_1[6][0]=(kgp[6][0])|(kgp[6][1]&kgp[5][0]);
assign temp_1[6][1]=(kgp[6][0])|(kgp[6][1]&kgp[5][1]);

assign temp_1[7][0]=(kgp[7][0])|(kgp[7][1]&kgp[6][0]);
assign temp_1[7][1]=(kgp[7][0])|(kgp[7][1]&kgp[6][1]);

assign temp_1[8][0]=(kgp[8][0])|(kgp[8][1]&kgp[7][0]);
assign temp_1[8][1]=(kgp[8][0])|(kgp[8][1]&kgp[7][1]);

assign temp_1[9][0]=(kgp[9][0])|(kgp[9][1]&kgp[8][0]);
assign temp_1[9][1]=(kgp[9][0])|(kgp[9][1]&kgp[8][1]);

assign temp_1[10][0]=(kgp[10][0])|(kgp[10][1]&kgp[9][0]);
assign temp_1[10][1]=(kgp[10][0])|(kgp[10][1]&kgp[9][1]);

assign temp_1[11][0]=(kgp[11][0])|(kgp[11][1]&kgp[10][0]);
assign temp_1[11][1]=(kgp[11][0])|(kgp[11][1]&kgp[10][1]);

assign temp_1[12][0]=(kgp[12][0])|(kgp[12][1]&kgp[11][0]);
assign temp_1[12][1]=(kgp[12][0])|(kgp[12][1]&kgp[11][1]);

assign temp_1[13][0]=(kgp[13][0])|(kgp[13][1]&kgp[12][0]);
assign temp_1[13][1]=(kgp[13][0])|(kgp[13][1]&kgp[12][1]);

assign temp_1[14][0]=(kgp[14][0])|(kgp[14][1]&kgp[13][0]);
assign temp_1[14][1]=(kgp[14][0])|(kgp[14][1]&kgp[13][1]);

assign temp_1[15][0]=(kgp[15][0])|(kgp[15][1]&kgp[14][0]);
assign temp_1[15][1]=(kgp[15][0])|(kgp[15][1]&kgp[14][1]);

assign temp_1[16][0]=(kgp[16][0])|(kgp[16][1]&kgp[15][0]);
assign temp_1[16][1]=(kgp[16][0])|(kgp[16][1]&kgp[15][1]);

assign temp_1[17][0]=(kgp[17][0])|(kgp[17][1]&kgp[16][0]);
assign temp_1[17][1]=(kgp[17][0])|(kgp[17][1]&kgp[16][1]);

assign temp_1[18][0]=(kgp[18][0])|(kgp[18][1]&kgp[17][0]);
assign temp_1[18][1]=(kgp[18][0])|(kgp[18][1]&kgp[17][1]);

assign temp_1[19][0]=(kgp[19][0])|(kgp[19][1]&kgp[18][0]);
assign temp_1[19][1]=(kgp[19][0])|(kgp[19][1]&kgp[18][1]);

assign temp_1[20][0]=(kgp[20][0])|(kgp[20][1]&kgp[19][0]);
assign temp_1[20][1]=(kgp[20][0])|(kgp[20][1]&kgp[19][1]);

assign temp_1[21][0]=(kgp[21][0])|(kgp[21][1]&kgp[20][0]);
assign temp_1[21][1]=(kgp[21][0])|(kgp[21][1]&kgp[20][1]);

assign temp_1[22][0]=(kgp[22][0])|(kgp[22][1]&kgp[21][0]);
assign temp_1[22][1]=(kgp[22][0])|(kgp[22][1]&kgp[21][1]);

assign temp_1[23][0]=(kgp[23][0])|(kgp[23][1]&kgp[22][0]);
assign temp_1[23][1]=(kgp[23][0])|(kgp[23][1]&kgp[22][1]);

assign temp_1[24][0]=(kgp[24][0])|(kgp[24][1]&kgp[23][0]);
assign temp_1[24][1]=(kgp[24][0])|(kgp[24][1]&kgp[23][1]);

assign temp_1[25][0]=(kgp[25][0])|(kgp[25][1]&kgp[24][0]);
assign temp_1[25][1]=(kgp[25][0])|(kgp[25][1]&kgp[24][1]);

assign temp_1[26][0]=(kgp[26][0])|(kgp[26][1]&kgp[25][0]);
assign temp_1[26][1]=(kgp[26][0])|(kgp[26][1]&kgp[25][1]);

assign temp_1[27][0]=(kgp[27][0])|(kgp[27][1]&kgp[26][0]);
assign temp_1[27][1]=(kgp[27][0])|(kgp[27][1]&kgp[26][1]);

assign temp_1[28][0]=(kgp[28][0])|(kgp[28][1]&kgp[27][0]);
assign temp_1[28][1]=(kgp[28][0])|(kgp[28][1]&kgp[27][1]);

assign temp_1[29][0]=(kgp[29][0])|(kgp[29][1]&kgp[28][0]);
assign temp_1[29][1]=(kgp[29][0])|(kgp[29][1]&kgp[28][1]);

assign temp_1[30][0]=(kgp[30][0])|(kgp[30][1]&kgp[29][0]);
assign temp_1[30][1]=(kgp[30][0])|(kgp[30][1]&kgp[29][1]);

assign temp_1[31][0]=(kgp[31][0])|(kgp[31][1]&kgp[30][0]);
assign temp_1[31][1]=(kgp[31][0])|(kgp[31][1]&kgp[30][1]);

assign temp_1[32][0]=(kgp[32][0])|(kgp[32][1]&kgp[31][0]);
assign temp_1[32][1]=(kgp[32][0])|(kgp[32][1]&kgp[31][1]);



// 2 - 32.30 ..... 16.14  15.13  14.12  13.11  12.10  11.9  10.8  9.7  8.6  7.5  6.4  5.3  4.2  3.1  2  1
assign temp_2[1][0]=temp_1[1][0];
assign temp_2[1][1]=temp_1[1][1];

assign temp_2[2][0]=temp_1[2][0];
assign temp_2[2][1]=temp_1[2][1];

assign temp_2[3][0]=(temp_1[3][0])|(temp_1[3][1]&temp_1[1][0]);
assign temp_2[3][1]=(temp_1[3][0])|(temp_1[3][1]&temp_1[1][1]);

assign temp_2[4][0]=(temp_1[4][0])|(temp_1[4][1]&temp_1[2][0]);
assign temp_2[4][1]=(temp_1[4][0])|(temp_1[4][1]&temp_1[2][1]);

assign temp_2[5][0]=(temp_1[5][0])|(temp_1[5][1]&temp_1[3][0]);
assign temp_2[5][1]=(temp_1[5][0])|(temp_1[5][1]&temp_1[3][1]);

assign temp_2[6][0]=(temp_1[6][0])|(temp_1[6][1]&temp_1[4][0]);
assign temp_2[6][1]=(temp_1[6][0])|(temp_1[6][1]&temp_1[4][1]);

assign temp_2[7][0]=(temp_1[7][0])|(temp_1[7][1]&temp_1[5][0]);
assign temp_2[7][1]=(temp_1[7][0])|(temp_1[7][1]&temp_1[5][1]);

assign temp_2[8][0]=(temp_1[8][0])|(temp_1[8][1]&temp_1[6][0]);
assign temp_2[8][1]=(temp_1[8][0])|(temp_1[8][1]&temp_1[6][1]);

assign temp_2[9][0]=(temp_1[9][0])|(temp_1[9][1]&temp_1[7][0]);
assign temp_2[9][1]=(temp_1[9][0])|(temp_1[9][1]&temp_1[7][1]);

assign temp_2[10][0]=(temp_1[10][0])|(temp_1[10][1]&temp_1[8][0]);
assign temp_2[10][1]=(temp_1[10][0])|(temp_1[10][1]&temp_1[8][1]);

assign temp_2[11][0]=(temp_1[11][0])|(temp_1[11][1]&temp_1[9][0]);
assign temp_2[11][1]=(temp_1[11][0])|(temp_1[11][1]&temp_1[9][1]);

assign temp_2[12][0]=(temp_1[12][0])|(temp_1[12][1]&temp_1[10][0]);
assign temp_2[12][1]=(temp_1[12][0])|(temp_1[12][1]&temp_1[10][1]);

assign temp_2[13][0]=(temp_1[13][0])|(temp_1[13][1]&temp_1[11][0]);
assign temp_2[13][1]=(temp_1[13][0])|(temp_1[13][1]&temp_1[11][1]);

assign temp_2[14][0]=(temp_1[14][0])|(temp_1[14][1]&temp_1[12][0]);
assign temp_2[14][1]=(temp_1[14][0])|(temp_1[14][1]&temp_1[12][1]);

assign temp_2[15][0]=(temp_1[15][0])|(temp_1[15][1]&temp_1[13][0]);
assign temp_2[15][1]=(temp_1[15][0])|(temp_1[15][1]&temp_1[13][1]);

assign temp_2[16][0]=(temp_1[16][0])|(temp_1[16][1]&temp_1[14][0]);
assign temp_2[16][1]=(temp_1[16][0])|(temp_1[16][1]&temp_1[14][1]);

assign temp_2[17][0]=(temp_1[17][0])|(temp_1[17][1]&temp_1[15][0]);
assign temp_2[17][1]=(temp_1[17][0])|(temp_1[17][1]&temp_1[15][1]);

assign temp_2[18][0]=(temp_1[18][0])|(temp_1[18][1]&temp_1[16][0]);
assign temp_2[18][1]=(temp_1[18][0])|(temp_1[18][1]&temp_1[16][1]);

assign temp_2[19][0]=(temp_1[19][0])|(temp_1[19][1]&temp_1[17][0]);
assign temp_2[19][1]=(temp_1[19][0])|(temp_1[19][1]&temp_1[17][1]);

assign temp_2[20][0]=(temp_1[20][0])|(temp_1[20][1]&temp_1[18][0]);
assign temp_2[20][1]=(temp_1[20][0])|(temp_1[20][1]&temp_1[18][1]);

assign temp_2[21][0]=(temp_1[21][0])|(temp_1[21][1]&temp_1[19][0]);
assign temp_2[21][1]=(temp_1[21][0])|(temp_1[21][1]&temp_1[19][1]);

assign temp_2[22][0]=(temp_1[22][0])|(temp_1[22][1]&temp_1[20][0]);
assign temp_2[22][1]=(temp_1[22][0])|(temp_1[22][1]&temp_1[20][1]);

assign temp_2[23][0]=(temp_1[23][0])|(temp_1[23][1]&temp_1[21][0]);
assign temp_2[23][1]=(temp_1[23][0])|(temp_1[23][1]&temp_1[21][1]);

assign temp_2[24][0]=(temp_1[24][0])|(temp_1[24][1]&temp_1[22][0]);
assign temp_2[24][1]=(temp_1[24][0])|(temp_1[24][1]&temp_1[22][1]);

assign temp_2[25][0]=(temp_1[25][0])|(temp_1[25][1]&temp_1[23][0]);
assign temp_2[25][1]=(temp_1[25][0])|(temp_1[25][1]&temp_1[23][1]);

assign temp_2[26][0]=(temp_1[26][0])|(temp_1[26][1]&temp_1[24][0]);
assign temp_2[26][1]=(temp_1[26][0])|(temp_1[26][1]&temp_1[24][1]);

assign temp_2[27][0]=(temp_1[27][0])|(temp_1[27][1]&temp_1[25][0]);
assign temp_2[27][1]=(temp_1[27][0])|(temp_1[27][1]&temp_1[25][1]);

assign temp_2[28][0]=(temp_1[28][0])|(temp_1[28][1]&temp_1[26][0]);
assign temp_2[28][1]=(temp_1[28][0])|(temp_1[28][1]&temp_1[26][1]);

assign temp_2[29][0]=(temp_1[29][0])|(temp_1[29][1]&temp_1[27][0]);
assign temp_2[29][1]=(temp_1[29][0])|(temp_1[29][1]&temp_1[27][1]);

assign temp_2[30][0]=(temp_1[30][0])|(temp_1[30][1]&temp_1[28][0]);
assign temp_2[30][1]=(temp_1[30][0])|(temp_1[30][1]&temp_1[28][1]);

assign temp_2[31][0]=(temp_1[31][0])|(temp_1[31][1]&temp_1[29][0]);
assign temp_2[31][1]=(temp_1[31][0])|(temp_1[31][1]&temp_1[29][1]);

assign temp_2[32][0]=(temp_1[32][0])|(temp_1[32][1]&temp_1[30][0]);
assign temp_2[32][1]=(temp_1[32][0])|(temp_1[32][1]&temp_1[30][1]);







// 4 - 32.28 ..... 16.12  15.11  14.10  13.9  12.8  11.7  10.6  9.5  8.4  7.3  6.2  5.1  4  3  2  1
assign temp_4[1][0]=temp_2[1][0];
assign temp_4[1][1]=temp_2[1][1];

assign temp_4[2][0]=temp_2[2][0];
assign temp_4[2][1]=temp_2[2][1];

assign temp_4[3][0]=temp_2[3][0];
assign temp_4[3][1]=temp_2[3][1];

assign temp_4[4][0]=temp_2[4][0];
assign temp_4[4][1]=temp_2[4][1];

assign temp_4[5][0]=(temp_2[5][0])|(temp_2[5][1]&temp_2[1][0]);
assign temp_4[5][1]=(temp_2[5][0])|(temp_2[5][1]&temp_2[1][1]);

assign temp_4[6][0]=(temp_2[6][0])|(temp_2[6][1]&temp_2[2][0]);
assign temp_4[6][1]=(temp_2[6][0])|(temp_2[6][1]&temp_2[2][1]);

assign temp_4[7][0]=(temp_2[7][0])|(temp_2[7][1]&temp_2[3][0]);
assign temp_4[7][1]=(temp_2[7][0])|(temp_2[7][1]&temp_2[3][1]);

assign temp_4[8][0]=(temp_2[8][0])|(temp_2[8][1]&temp_2[4][0]);
assign temp_4[8][1]=(temp_2[8][0])|(temp_2[8][1]&temp_2[4][1]);

assign temp_4[9][0]=(temp_2[9][0])|(temp_2[9][1]&temp_2[5][0]);
assign temp_4[9][1]=(temp_2[9][0])|(temp_2[9][1]&temp_2[5][1]);

assign temp_4[10][0]=(temp_2[10][0])|(temp_2[10][1]&temp_2[6][0]);
assign temp_4[10][1]=(temp_2[10][0])|(temp_2[10][1]&temp_2[6][1]);

assign temp_4[11][0]=(temp_2[11][0])|(temp_2[11][1]&temp_2[7][0]);
assign temp_4[11][1]=(temp_2[11][0])|(temp_2[11][1]&temp_2[7][1]);

assign temp_4[12][0]=(temp_2[12][0])|(temp_2[12][1]&temp_2[8][0]);
assign temp_4[12][1]=(temp_2[12][0])|(temp_2[12][1]&temp_2[8][1]);

assign temp_4[13][0]=(temp_2[13][0])|(temp_2[13][1]&temp_2[9][0]);
assign temp_4[13][1]=(temp_2[13][0])|(temp_2[13][1]&temp_2[9][1]);

assign temp_4[14][0]=(temp_2[14][0])|(temp_2[14][1]&temp_2[10][0]);
assign temp_4[14][1]=(temp_2[14][0])|(temp_2[14][1]&temp_2[10][1]);

assign temp_4[15][0]=(temp_2[15][0])|(temp_2[15][1]&temp_2[11][0]);
assign temp_4[15][1]=(temp_2[15][0])|(temp_2[15][1]&temp_2[11][1]);

assign temp_4[16][0]=(temp_2[16][0])|(temp_2[16][1]&temp_2[12][0]);
assign temp_4[16][1]=(temp_2[16][0])|(temp_2[16][1]&temp_2[12][1]);

assign temp_4[17][0]=(temp_2[17][0])|(temp_2[17][1]&temp_2[13][0]);
assign temp_4[17][1]=(temp_2[17][0])|(temp_2[17][1]&temp_2[13][1]);

assign temp_4[18][0]=(temp_2[18][0])|(temp_2[18][1]&temp_2[14][0]);
assign temp_4[18][1]=(temp_2[18][0])|(temp_2[18][1]&temp_2[14][1]);

assign temp_4[19][0]=(temp_2[19][0])|(temp_2[19][1]&temp_2[15][0]);
assign temp_4[19][1]=(temp_2[19][0])|(temp_2[19][1]&temp_2[15][1]);

assign temp_4[20][0]=(temp_2[20][0])|(temp_2[20][1]&temp_2[16][0]);
assign temp_4[20][1]=(temp_2[20][0])|(temp_2[20][1]&temp_2[16][1]);

assign temp_4[21][0]=(temp_2[21][0])|(temp_2[21][1]&temp_2[17][0]);
assign temp_4[21][1]=(temp_2[21][0])|(temp_2[21][1]&temp_2[17][1]);

assign temp_4[22][0]=(temp_2[22][0])|(temp_2[22][1]&temp_2[18][0]);
assign temp_4[22][1]=(temp_2[22][0])|(temp_2[22][1]&temp_2[18][1]);

assign temp_4[23][0]=(temp_2[23][0])|(temp_2[23][1]&temp_2[19][0]);
assign temp_4[23][1]=(temp_2[23][0])|(temp_2[23][1]&temp_2[19][1]);

assign temp_4[24][0]=(temp_2[24][0])|(temp_2[24][1]&temp_2[20][0]);
assign temp_4[24][1]=(temp_2[24][0])|(temp_2[24][1]&temp_2[20][1]);

assign temp_4[25][0]=(temp_2[25][0])|(temp_2[25][1]&temp_2[21][0]);
assign temp_4[25][1]=(temp_2[25][0])|(temp_2[25][1]&temp_2[21][1]);

assign temp_4[26][0]=(temp_2[26][0])|(temp_2[26][1]&temp_2[22][0]);
assign temp_4[26][1]=(temp_2[26][0])|(temp_2[26][1]&temp_2[22][1]);

assign temp_4[27][0]=(temp_2[27][0])|(temp_2[27][1]&temp_2[23][0]);
assign temp_4[27][1]=(temp_2[27][0])|(temp_2[27][1]&temp_2[23][1]);

assign temp_4[28][0]=(temp_2[28][0])|(temp_2[28][1]&temp_2[24][0]);
assign temp_4[28][1]=(temp_2[28][0])|(temp_2[28][1]&temp_2[24][1]);

assign temp_4[29][0]=(temp_2[29][0])|(temp_2[29][1]&temp_2[25][0]);
assign temp_4[29][1]=(temp_2[29][0])|(temp_2[29][1]&temp_2[25][1]);

assign temp_4[30][0]=(temp_2[30][0])|(temp_2[30][1]&temp_2[26][0]);
assign temp_4[30][1]=(temp_2[30][0])|(temp_2[30][1]&temp_2[26][1]);

assign temp_4[31][0]=(temp_2[31][0])|(temp_2[31][1]&temp_2[27][0]);
assign temp_4[31][1]=(temp_2[31][0])|(temp_2[31][1]&temp_2[27][1]);

assign temp_4[32][0]=(temp_2[32][0])|(temp_2[32][1]&temp_2[28][0]);
assign temp_4[32][1]=(temp_2[32][0])|(temp_2[32][1]&temp_2[28][1]);

// 8 - 32.24 ..... 16.8  15.7  14.6  13.5  12.4  11.3  10.2  9.1  8  7  6  5  4  3  2  1
assign temp_8[1][0]=temp_4[1][0];
assign temp_8[1][1]=temp_4[1][1];

assign temp_8[2][0]=temp_4[2][0];
assign temp_8[2][1]=temp_4[2][1];

assign temp_8[3][0]=temp_4[3][0];
assign temp_8[3][1]=temp_4[3][1];

assign temp_8[4][0]=temp_4[4][0];
assign temp_8[4][1]=temp_4[4][1];

assign temp_8[5][0]=temp_4[5][0];
assign temp_8[5][1]=temp_4[5][1];

assign temp_8[6][0]=temp_4[6][0];
assign temp_8[6][1]=temp_4[6][1];

assign temp_8[7][0]=temp_4[7][0];
assign temp_8[7][1]=temp_4[7][1];

assign temp_8[8][0]=temp_4[8][0];
assign temp_8[8][1]=temp_4[8][1];

assign temp_8[9][0]=(temp_4[9][0])|(temp_4[9][1]&temp_4[1][0]);
assign temp_8[9][1]=(temp_4[9][0])|(temp_4[9][1]&temp_4[1][1]);

assign temp_8[10][0]=(temp_4[10][0])|(temp_4[10][1]&temp_4[2][0]);
assign temp_8[10][1]=(temp_4[10][0])|(temp_4[10][1]&temp_4[2][1]);

assign temp_8[11][0]=(temp_4[11][0])|(temp_4[11][1]&temp_4[3][0]);
assign temp_8[11][1]=(temp_4[11][0])|(temp_4[11][1]&temp_4[3][1]);

assign temp_8[12][0]=(temp_4[12][0])|(temp_4[12][1]&temp_4[4][0]);
assign temp_8[12][1]=(temp_4[12][0])|(temp_4[12][1]&temp_4[4][1]);

assign temp_8[13][0]=(temp_4[13][0])|(temp_4[13][1]&temp_4[5][0]);
assign temp_8[13][1]=(temp_4[13][0])|(temp_4[13][1]&temp_4[5][1]);

assign temp_8[14][0]=(temp_4[14][0])|(temp_4[14][1]&temp_4[6][0]);
assign temp_8[14][1]=(temp_4[14][0])|(temp_4[14][1]&temp_4[6][1]);

assign temp_8[15][0]=(temp_4[15][0])|(temp_4[15][1]&temp_4[7][0]);
assign temp_8[15][1]=(temp_4[15][0])|(temp_4[15][1]&temp_4[7][1]);

assign temp_8[16][0]=(temp_4[16][0])|(temp_4[16][1]&temp_4[8][0]);
assign temp_8[16][1]=(temp_4[16][0])|(temp_4[16][1]&temp_4[8][1]);

assign temp_8[17][0]=(temp_4[17][0])|(temp_4[17][1]&temp_4[9][0]);
assign temp_8[17][1]=(temp_4[17][0])|(temp_4[17][1]&temp_4[9][1]);

assign temp_8[18][0]=(temp_4[18][0])|(temp_4[18][1]&temp_4[10][0]);
assign temp_8[18][1]=(temp_4[18][0])|(temp_4[18][1]&temp_4[10][1]);

assign temp_8[19][0]=(temp_4[19][0])|(temp_4[19][1]&temp_4[11][0]);
assign temp_8[19][1]=(temp_4[19][0])|(temp_4[19][1]&temp_4[11][1]);

assign temp_8[20][0]=(temp_4[20][0])|(temp_4[20][1]&temp_4[12][0]);
assign temp_8[20][1]=(temp_4[20][0])|(temp_4[20][1]&temp_4[12][1]);

assign temp_8[21][0]=(temp_4[21][0])|(temp_4[21][1]&temp_4[13][0]);
assign temp_8[21][1]=(temp_4[21][0])|(temp_4[21][1]&temp_4[13][1]);

assign temp_8[22][0]=(temp_4[22][0])|(temp_4[22][1]&temp_4[14][0]);
assign temp_8[22][1]=(temp_4[22][0])|(temp_4[22][1]&temp_4[14][1]);

assign temp_8[23][0]=(temp_4[23][0])|(temp_4[23][1]&temp_4[15][0]);
assign temp_8[23][1]=(temp_4[23][0])|(temp_4[23][1]&temp_4[15][1]);

assign temp_8[24][0]=(temp_4[24][0])|(temp_4[24][1]&temp_4[16][0]);
assign temp_8[24][1]=(temp_4[24][0])|(temp_4[24][1]&temp_4[16][1]);

assign temp_8[25][0]=(temp_4[25][0])|(temp_4[25][1]&temp_4[17][0]);
assign temp_8[25][1]=(temp_4[25][0])|(temp_4[25][1]&temp_4[17][1]);

assign temp_8[26][0]=(temp_4[26][0])|(temp_4[26][1]&temp_4[18][0]);
assign temp_8[26][1]=(temp_4[26][0])|(temp_4[26][1]&temp_4[18][1]);

assign temp_8[27][0]=(temp_4[27][0])|(temp_4[27][1]&temp_4[19][0]);
assign temp_8[27][1]=(temp_4[27][0])|(temp_4[27][1]&temp_4[19][1]);

assign temp_8[28][0]=(temp_4[28][0])|(temp_4[28][1]&temp_4[20][0]);
assign temp_8[28][1]=(temp_4[28][0])|(temp_4[28][1]&temp_4[20][1]);

assign temp_8[29][0]=(temp_4[29][0])|(temp_4[29][1]&temp_4[21][0]);
assign temp_8[29][1]=(temp_4[29][0])|(temp_4[29][1]&temp_4[21][1]);

assign temp_8[30][0]=(temp_4[30][0])|(temp_4[30][1]&temp_4[22][0]);
assign temp_8[30][1]=(temp_4[30][0])|(temp_4[30][1]&temp_4[22][1]);

assign temp_8[31][0]=(temp_4[31][0])|(temp_4[31][1]&temp_4[23][0]);
assign temp_8[31][1]=(temp_4[31][0])|(temp_4[31][1]&temp_4[23][1]);

assign temp_8[32][0]=(temp_4[32][0])|(temp_4[32][1]&temp_4[24][0]);
assign temp_8[32][1]=(temp_4[32][0])|(temp_4[32][1]&temp_4[24][1]);

//16 -32.16 32.15...... 16  15  14 13  12  11  10  9  8  7  6  5  4  3  2  1
assign temp_16[1][0]=temp_8[1][0];
assign temp_16[1][1]=temp_8[1][1];

assign temp_16[2][0]=temp_8[2][0];
assign temp_16[2][1]=temp_8[2][1];

assign temp_16[3][0]=temp_8[3][0];
assign temp_16[3][1]=temp_8[3][1];

assign temp_16[4][0]=temp_8[4][0];
assign temp_16[4][1]=temp_8[4][1];

assign temp_16[5][0]=temp_8[5][0];
assign temp_16[5][1]=temp_8[5][1];

assign temp_16[6][0]=temp_8[6][0];
assign temp_16[6][1]=temp_8[6][1];

assign temp_16[7][0]=temp_8[7][0];
assign temp_16[7][1]=temp_8[7][1];

assign temp_16[8][0]=temp_8[8][0];
assign temp_16[8][1]=temp_8[8][1];

assign temp_16[9][0]=temp_8[9][0];
assign temp_16[9][1]=temp_8[9][1];

assign temp_16[10][0]=temp_8[10][0];
assign temp_16[10][1]=temp_8[10][1];

assign temp_16[11][0]=temp_8[11][0];
assign temp_16[11][1]=temp_8[11][1];

assign temp_16[12][0]=temp_8[12][0];
assign temp_16[12][1]=temp_8[12][1];

assign temp_16[13][0]=temp_8[13][0];
assign temp_16[13][1]=temp_8[13][1];

assign temp_16[14][0]=temp_8[14][0];
assign temp_16[14][1]=temp_8[14][1];

assign temp_16[15][0]=temp_8[15][0];
assign temp_16[15][1]=temp_8[15][1];

assign temp_16[16][0]=temp_8[16][0];
assign temp_16[16][1]=temp_8[16][1];

assign temp_16[17][0]=(temp_8[17][0])|(temp_8[17][1]&temp_8[1][0]);
assign temp_16[17][1]=(temp_8[17][0])|(temp_8[17][1]&temp_8[1][1]);

assign temp_16[18][0]=(temp_8[18][0])|(temp_8[18][1]&temp_8[2][0]);
assign temp_16[18][1]=(temp_8[18][0])|(temp_8[18][1]&temp_8[2][1]);

assign temp_16[19][0]=(temp_8[19][0])|(temp_8[19][1]&temp_8[3][0]);
assign temp_16[19][1]=(temp_8[19][0])|(temp_8[19][1]&temp_8[3][1]);

assign temp_16[20][0]=(temp_8[20][0])|(temp_8[20][1]&temp_8[4][0]);
assign temp_16[20][1]=(temp_8[20][0])|(temp_8[20][1]&temp_8[4][1]);

assign temp_16[21][0]=(temp_8[21][0])|(temp_8[21][1]&temp_8[5][0]);
assign temp_16[21][1]=(temp_8[21][0])|(temp_8[21][1]&temp_8[5][1]);

assign temp_16[22][0]=(temp_8[22][0])|(temp_8[22][1]&temp_8[6][0]);
assign temp_16[22][1]=(temp_8[22][0])|(temp_8[22][1]&temp_8[6][1]);

assign temp_16[23][0]=(temp_8[23][0])|(temp_8[23][1]&temp_8[7][0]);
assign temp_16[23][1]=(temp_8[23][0])|(temp_8[23][1]&temp_8[7][1]);

assign temp_16[24][0]=(temp_8[24][0])|(temp_8[24][1]&temp_8[8][0]);
assign temp_16[24][1]=(temp_8[24][0])|(temp_8[24][1]&temp_8[8][1]);

assign temp_16[25][0]=(temp_8[25][0])|(temp_8[25][1]&temp_8[9][0]);
assign temp_16[25][1]=(temp_8[25][0])|(temp_8[25][1]&temp_8[9][1]);

assign temp_16[26][0]=(temp_8[26][0])|(temp_8[26][1]&temp_8[10][0]);
assign temp_16[26][1]=(temp_8[26][0])|(temp_8[26][1]&temp_8[10][1]);

assign temp_16[27][0]=(temp_8[27][0])|(temp_8[27][1]&temp_8[11][0]);
assign temp_16[27][1]=(temp_8[27][0])|(temp_8[27][1]&temp_8[11][1]);

assign temp_16[28][0]=(temp_8[28][0])|(temp_8[28][1]&temp_8[12][0]);
assign temp_16[28][1]=(temp_8[28][0])|(temp_8[28][1]&temp_8[12][1]);

assign temp_16[29][0]=(temp_8[29][0])|(temp_8[29][1]&temp_8[13][0]);
assign temp_16[29][1]=(temp_8[29][0])|(temp_8[29][1]&temp_8[13][1]);

assign temp_16[30][0]=(temp_8[30][0])|(temp_8[30][1]&temp_8[14][0]);
assign temp_16[30][1]=(temp_8[30][0])|(temp_8[30][1]&temp_8[14][1]);

assign temp_16[31][0]=(temp_8[31][0])|(temp_8[31][1]&temp_8[15][0]);
assign temp_16[31][1]=(temp_8[31][0])|(temp_8[31][1]&temp_8[15][1]);

assign temp_16[32][0]=(temp_8[32][0])|(temp_8[32][1]&temp_8[16][0]);
assign temp_16[32][1]=(temp_8[32][0])|(temp_8[32][1]&temp_8[16][1]);

//GK Calculating
assign kg[1]=temp_16[1][1];
assign kg[2]=temp_16[2][1];
assign kg[3]=temp_16[3][1];
assign kg[4]=temp_16[4][1];
assign kg[5]=temp_16[5][1];
assign kg[6]=temp_16[6][1];
assign kg[7]=temp_16[7][1];
assign kg[8]=temp_16[8][1];
assign kg[9]=temp_16[9][1];
assign kg[10]=temp_16[10][1];
assign kg[11]=temp_16[11][1];
assign kg[12]=temp_16[12][1];
assign kg[13]=temp_16[13][1];
assign kg[14]=temp_16[14][1];
assign kg[15]=temp_16[15][1];
assign kg[16]=temp_16[16][1];
assign kg[17]=temp_16[17][1];
assign kg[18]=temp_16[18][1];
assign kg[19]=temp_16[19][1];
assign kg[20]=temp_16[20][1];
assign kg[21]=temp_16[21][1];
assign kg[22]=temp_16[22][1];
assign kg[23]=temp_16[23][1];
assign kg[24]=temp_16[24][1];
assign kg[25]=temp_16[25][1];
assign kg[26]=temp_16[26][1];
assign kg[27]=temp_16[27][1];
assign kg[28]=temp_16[28][1];
assign kg[29]=temp_16[29][1];
assign kg[30]=temp_16[30][1];
assign kg[31]=temp_16[31][1];
assign kg[32]=temp_16[32][1];

//calculating sum
assign sum[1]=a[1]^b[1]^cin;
assign sum[2]=kg[1]^a[2]^b[2];
assign sum[3]=kg[2]^a[3]^b[3];
assign sum[4]=kg[3]^a[4]^b[4];
assign sum[5]=kg[4]^a[5]^b[5];
assign sum[6]=kg[5]^a[6]^b[6];
assign sum[7]=kg[6]^a[7]^b[7];
assign sum[8]=kg[7]^a[8]^b[8];
assign sum[9]=kg[8]^a[9]^b[9];
assign sum[10]=kg[9]^a[10]^b[10];
assign sum[11]=kg[10]^a[11]^b[11];
assign sum[12]=kg[11]^a[12]^b[12];
assign sum[13]=kg[12]^a[13]^b[13];
assign sum[14]=kg[13]^a[14]^b[14];
assign sum[15]=kg[14]^a[15]^b[15];
assign sum[16]=kg[15]^a[16]^b[16];
assign sum[17]=kg[16]^a[17]^b[17];
assign sum[18]=kg[17]^a[18]^b[18];
assign sum[19]=kg[18]^a[19]^b[19];
assign sum[20]=kg[19]^a[20]^b[20];
assign sum[21]=kg[20]^a[21]^b[21];
assign sum[22]=kg[21]^a[22]^b[22];
assign sum[23]=kg[22]^a[23]^b[23];
assign sum[24]=kg[23]^a[24]^b[24];
assign sum[25]=kg[24]^a[25]^b[25];
assign sum[26]=kg[25]^a[26]^b[26];
assign sum[27]=kg[26]^a[27]^b[27];
assign sum[28]=kg[27]^a[28]^b[28];
assign sum[29]=kg[28]^a[29]^b[29];
assign sum[30]=kg[29]^a[30]^b[30];
assign sum[31]=kg[30]^a[31]^b[31];
assign sum[32]=kg[31]^a[32]^b[32];
assign cout=kg[32];

endmodule



