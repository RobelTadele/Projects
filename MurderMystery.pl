%AllThePeople
person(X):- lawyer(X).
person(X):- doctor(X).

setof(X, person(X), People).

pair_of_people(X,Y) :-
    setof(P, person(P), People),
    member(X, People),
    member(Y, People),
    X \= Y.

%UnrelatedPeople
unrelated(X,Y) :-
    pair_of_people(X,Y),
    not(related(X,Y)).

doctorList(X,_):- person(X),
    doctor(X).

lawyerList(X,_):- person(X),
    lawyer(X).    

%Genders
male(aaronGreene).
male(duane).
male(edwin).
female(betty).
female(clara).
female(floraBrown).

%Occupations
lawyer(clara).
lawyer(edwin).
lawyer(floraBrown).

doctor(aaronGreene).
doctor(betty).
doctor(duane).

%WhoIsRelatedToWho
related(aaronGreene,betty).
related(betty,aaronGreene).
related(aaronGreene,clara).
related(clara,aaronGreene).
related(clara,betty).
related(betty,clara).

related(duane, floraBrown).
related(floraBrown, duane).
related(edwin, floraBrown).
related(floraBrown,edwin).
related(edwin,duane).
related(duane,edwin).

start:- write("-> Hello and Welcome to the Murder Mystery Game.\nThere has been a horrific murder and its up to\nyou to guess who the killer and the victim is.\n"),
        write("-> To guess who the killer and the victim are type\nsolution(Killer, Victim) With the name of who\nyou think the Killer is and who you think the Victim is in the correct spots\n"),
        write("=> Enter 'CluesA to CluesF' for clues and to re-read the clues just type menu().").

%ClueswithTheirPairingValues
menu():- clueA; clueB; clueC; clueD; clueE; clueF.

clueA:- write('If the killer and the victim were related, the killer was a man\nTo see pairings type "killer_male(K,V)." Keep hitting the space bar to see all the pairings\n').
killer_male(K,V):- male(K), related(K,V).

clueB:- write('If the killer and the victim were not related, the killer was a doctor\nTo see pairings type "killer_doctor(K,V)." Keep hitting the space bar to see all the pairings\n').
killer_doctor(K,V):- unrelated(K,V),doctor(K).

clueC:- write('If the killer and the victim had the same occupation, the victim was a man\nTo see pairings type "victim_male(K,V)." Keep hitting the space bar to see all the pairings\n').
victim_male(K,V):- doctor(V), male(V), doctor(K), K \= V.
victim_male(K,V):- lawyer(V), male(V), lawyer(K), K \= V.

clueD:- write('If the killer and the victim had different occupations, the victim was a woman\nTo see pairings type "victim_female(K,V)." Keep hitting the space bar to see all the pairings\n').
victim_female(K,V):- lawyer(K), doctor(V), female(V).
victim_female(K,V):- doctor(K), lawyer(V), female(V).

clueE:- write('If the killer and the victim were of the same sex, the killer was a lawyer\nTo see pairings type "killer_lawyer(K,V)." Keep hitting the space bar to see all the pairings\n').
killer_lawyer(K,V):- male(K), male(V), lawyer(K), K \= V.
killer_lawyer(K,V):- female(K), female(V), lawyer(K), K \= V.

clueF:- write('If the killer and victim were different sexes, the victim was a doctor\nTo see pairings type "victim_doctor(K,V)." Keep hitting the space bar to see all the pairings\n').
victim_doctor(K,V):- male(K), female(V), doctor(V). 
victim_doctor(K,V):- female(K), male(V), doctor(V). 


%AnsBettyKilledDuane

%UserOuputandInput
solution(Killer, Victim):- 
    (Killer = 'betty', Victim = 'duane' -> correct, !; wrong).


correct :- writeln('You guessed Correctly, Congratulations !!').
wrong :- writeln('Oops, Try again!').

