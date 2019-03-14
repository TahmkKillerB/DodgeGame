program dodgegame;
uses Crt;

Type
	Tab = array[1..40,1..25]of byte;
Var
	T:Tab;
	lvl:char;
	diff:integer;
	
Procedure delay;
	var
		i:longint;
	Begin
		for i:=1 to 1000000 Do
	end;

Procedure Affich(T:Tab);
	Var
			 i,j,a,b:integer;
	Begin
		clrscr;
		for a:=1 to 26 Do
			Begin
				gotoxy(41,a);
				write('|');
			end;
		for b:=1 to 40 Do
			Begin
				gotoxy(b,26);
				write('_');
			end;
		for i:=1 to 40 Do
			for j:= 1 to 25 Do
				begin
					if (j=1) and (T[i,j]=1) Then
						Begin
							GotoXY(i,j);
							write('O');
						end;
					if (j<>1) and (T[i,j]=1) Then
						Begin
							GotoXY(i,j);
							write('~');
						end;
				end;
	end;
					
Procedure Obstacles(Var T:Tab);
	Var
			 n,i:integer;
	Begin
		Randomize;
			for i:=1 to 40 Do
				T[i,25]:=0;
			Repeat
				n:=Random(32)+1;
				for i:=1 to 40 Do
					Begin
						if (i=n) or(i=n+1)or(i=n+2)or(i=n+3)or(i=n+4)or(i=n+5)or(i=n+6)or(i=n+7)or(i=n+8) Then
							continue;
						T[i,25]:=1;	
					end;
				until not(KeyPressed);
	end;
					
		
Function Collision(T:tab):Boolean;
	var
		 o,x,i:integer;
		 Bol:Boolean;
	Begin
		Bol:=False;
		for o:=1 to 40 Do
			if T[o,1]=1 Then
				x:=o;
		For i:=1 to 40 Do
			if T[i,2]=1 Then
				if i=x Then
					bol:=True;
		Collision:=Bol;
	end;		
		

Procedure Game_Process(Var T:Tab; Diff:integer);
	Var
		x,compt,o,p,limit,i:integer;
	Begin
		delay;
		delay;
		x:=20;
		compt:=0;
		T[x,1]:=1;
		affich(T);
		limit:=1;
	  Repeat
			Inc(Compt);
			if readkey='q' Then
				If T[1,1]=1 Then
					T[1,1]:=1
				Else
					Begin
						T[x,1]:=0;
						x:=x-1;
						T[x,1]:=1;
					end;
			if readkey='d' Then
				If T[40,1]=1 Then
					T[40,1]:=1
				Else
					Begin
						T[x,1]:=0;
						x:=x+1;
						T[x,1]:=1;
					end;
				if compt = 1 Then
					obstacles(T)
					else
						Begin
							
							for o:=1 to 40	Do
								for p:= 3 to 25 Do
									begin
									T[o,p-1]:=T[o,p];
									if (o=40) and (p=25) Then
										inc(limit);
									end;
							if (limit mod Diff=0) then
								obstacles(T)
							Else
								for i:=1 to 40 Do
								T[i,25]:=0;
									
							
						end;
				Affich(T);
		until Collision(T);
	end;

procedure center(line:string); {this procedure centers a line of text on the screen}
          var
             tab,len:integer;
          begin
               len:=length(line);
               tab:=(78-len) div 2;
               writeln(' ':tab,line);
          end;


procedure intro; {this is the splash screen at the beginning of the program}
          begin
               center('The Coolest Game Ever (Not Really)');
               center('---------------------------------');
               writeln;
               center('   _--_     _--_    _--_     _--_     _--_     _--_     _--_     _--_         ');
               center('  (    )~~~(    )  (    )~~~(    )   (    )~~~(    )   (    )~~~(    )        ');
               center('   \           /    \           /     \           /     \           /         ');
               center('    (  '' _ `  )      (  '' _ `  )       (  '' _ `  )       (  '' _ `  )          ');
               center('     \       /        \       /         \       /         \       /           ');
               center('   .__( `-'' )          ( `-'' )           ( `-'' )        .__( `-'' )  ___       ');
               center('  / !  `---'' \      _--''`---_          .--`---''\       /   /`---''`-''   \      ');
               center(' /  \         !    /         \___     /        _>\    /   /          ._/   __ ');
               center('!   /\        )   /   /       !  \   /  /-___-''   ) /''   /.-----\___/     /  )');
               center('!   !_\       ). (   <        !__/ /''  (        _/  \___//          `----''   !');
               center(' \    \       ! \ \   \      /\    \___/`------'' )       \            ______/ ');
               center('  \___/   )  /__/  \--/   \ /  \  ._    \      `<         `--_____----''       ');
               center('    \    /   !       `.    )-   \/  ) ___>-_     \   /-\    \    /            ');
               center('    /   !   /         !   !  `.    / /      `-_   `-/  /    !   !             ');
               center('   !   /__ /___       /  /__   \__/ (  \---__/ `-_    /     /  /__            ');
               center('   (______)____)     (______)        \__)         `-_/     (______)           ');
               writeln;
               writeln;
               center('PLAY IT!  IT''S FUN FUN FUN!!(Not Really)');
               writeln;
               center('(Press any key to play.)');
               readkey;
          end;

Procedure Difficulty(Var n:char);
	Begin
		clrscr;
		Writeln;Writeln;
		center('Control your ball by holding down ''Q'' to go left, and ''D'' to go right.');
		Writeln;Writeln;
		center('Chose your difficulty level : ');
		writeln;writeln;
		Writeln('   1) Easy :v');
		writeln('   2) Doable :/');
		writeln('   3) Pretty much IMPOSSIBLE >:(');
		Writeln;Writeln;
		Center('Type down 1, 2 or 3.');
		Repeat
			n:=Readkey;
		until (n='1') or (n='2') or (n='3') ;
	end;
			
procedure outro; {this is the splash screen when the player exits the game}
          begin
               delay;
               delay;
               delay;
               clrscr;
               center('Shit happens... But don''t let it beat you.');
               writeln;
               center('                   *****************                     ');
               center('               ******               ******               ');
               center('           ****                           ****           ');
               center('        ****                                 ****        ');
               center('      ***                                       ***      ');
               center('     **           ***               ***           **     ');
               center('   ***          *******           *******          ***   ');
               center('  **            *******           *******            **  ');
               center(' **             *******           *******             ** ');
               center(' **               ***               ***               ** ');
               center('**                                                     **');
               center('**                                                     **');
               center(' **                                                   ** ');
               center(' **                  ***************                 ** ');
               center('  **            ******             ******            **  ');
               center('   ***       ****                       ****       ***   ');
               center('     **    ***                             ***    **     ');
               center('      ***                                       ***      ');
               center('        ****                                 ****        ');
               center('           ****                           ****           ');
               center('               ******               ******               ');
               center('                    *****************                    ');
							 writeln;writeln;writeln;
							 Center('Press ''Enter'' to leave the game :)');
							 readln;
          end;
		
	

Begin
	intro;
	difficulty(lvl);
	Case lvl Of
		'1':diff:=22;
		'2':diff:=16;
		'3':diff:=12;
	end;
	Game_process(T,diff);
	outro;
end.
			
			
			
					
				
				
	
		