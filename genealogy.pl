%RobelTadele
%COSC4153Programming Languages
%programmingAssignment 3 
%GenealogyofJesus
%Sep182021
%Pleaserefertothesamplequeryformatlistedbelow


%Genders
%Males
male(abraham).
male(isaac).
male(jacob).
male(terah).
male(perez).
male(perez).
male(hezron).
male(ram).
male(amminadab).
male(nahshon).
male(salmon).
male(boaz).
male(obed).
male(jesse).
male(david).
male(solomon).
male(rehoboam).
male(abijah).
male(asa).
male(jehoshaphat).
male(jehoram).
male(uzziah). 
male(jotham).
male(ahaz). 
male(hezekiah). 
male(manasseh). 
male(amon). 
male(josiah) .
male(jeconiah).
male(shealtiel  ).
male(zerubbabel).
male(abihud ).
male(eliakim).
male(azor ).
male(zadok ).
male(akim ).
male(elihud).
male(eleazar).
male(matthan).
male(jacob).
male(joseph).

%Females
female(tamar).
female(rahab).
female(ruth).
female(uriahWife).


%AistheparentofB
parent(abraham,isaac).
parent(isaac,jacob).
parent(jacob,judah).
parent(judah,terah).
parent(judah,perez).
parent(perez,hezron).
parent(hezron,ram).
parent(ram,amminadab).
parent(amminadab,nahsho).
parent(nahshon,salmon).
parent(salmon,boaz).
parent(boaz,obed).
parent(obed,jesse).
parent(jesse,david).
parent(david,solomon).
parent(solomon,rehoboam).
parent(rehoboam,abijah).
parent(abijah,asa).
parent(asa, jehoshaphat).
parent(jehoshaphat, jehoram).
parent(jehoram,uzziah).
parent(uzziah,jotham). 
parent(jotham,ahaz).
parent(ahaz, hezekiah). 
parent(hezekiah,manasseh). 
parent(manasseh,amon). 
parent(amon,josiah). 
parent(josiah,jeconiah) .
parent(jeconiah,shealtiel).
parent(shealtiel,zerubbabel ).
parent(zerubbabel,abihud).
parent(abihud,eliakim ).
parent(eliakim,azor ).
parent(azor,zadok ).
parent(zadok,akim ).
parent(akim,elihud ).
parent(elihud,eleazar).
parent(eleazar,matthan).
parent(matthan,jacob).
parent(jacob,joseph).
parent(joseph,jesus).

parent(tamar,zerah).
parent(rahab,boaz).
parent(ruth,obed).
parent(uriahWife,solomon).

siblings(terah,perez).




%RulesAndQuerySamples
%ParentCanBeFatherorMother
/*
parent(X, jacob).
X = isaac ;
X = matthan.
*/

%FatherOfAnyOfTheMan
father_of(C,F):- 
    parent(F,C), male(F),
    write('Father of '), write(C), write(' is '), write(F).

/*
father_of(jesus,_).
Father of jesus is joseph
*/

%FindTheSonsOfAnyMan
sons_of(F,C):- 
    parent(F,C), male(F),
    write('The son of '), write(F), write(' is '), write(C).
    /*
    sons_of(akim,_).
    Son of akim is elihud
    */

%Doesnwork
%FindTheGrandfatherOfAnyOfTheMen
grandFather_of(X,Z):- 
    parent(Z,X), male(Z), parent(Y,Z),
    write('The Grandfather of '), write(X), write(' is '), write(Y).

    /*
    grandFather_of(matthan,_).
    The Grandfather of matthan is elihud
    */

%FindtheMotherofanyman.
mother_of(C,M):- 
    parent(M,C), female(M),
    write('The Mother of '), write(C), write(' is '), write(M).
    /*
     mother_of(obed,_).
     The Mother of obed is ruth
    */

%Displayalistofallthepairsofsiblings.
    /*
    siblings(X,Y).
    X = terah,
    Y = perez.
    */

%Displayalistofallthewoman.
    /*
    female(X).
    X = tamar ;
    X = rahab ;
    X = ruth ;
    X = uriahWife.
    */