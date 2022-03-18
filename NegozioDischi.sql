create database NegozioDischi --creazione database
--creazione tabelle
create table Band (
IDBand int identity(1,1) not null constraint PK_Band primary key,
Nome varchar(30) not null,
NumeroComponebti integer not null
)

create table Album (
IDAlbum int identity(1,1) not null constraint PK_Album primary key,
Titolo varchar(20) not null, 
AnnoDiUscita int not null,
CasaDiscografica varchar(20) not null,
Genere varchar (20) not null  constraint chk_Genere check (Genere='Classico' or Genere='Jazz' or Genere='Pop' or Genere='Metal'),
SupportoDiDistribuzione varchar(10) not null  constraint chk_Supporto check (SupportoDiDistribuzione= 'CD' or SupportoDiDistribuzione='Vinile' or supportoDiDistribuzione='Streaming'),
IDBand int not null constraint Fk_Band foreign key references Band(IDBand)
constraint SingoloAlbum unique(Titolo,AnnoDiUscita,CasaDiscografica,Genere,SupportoDiDistribuzione)
)

create table Brano(
IDBrano int identity(1,1) not null constraint PK_Brano primary key,
Titolo varchar(30) not null,
Durata integer not null
)

create table AlbumBrano(
IDAlbum int not null,
IDBrano int not null,
constraint FK_Album foreign key (IDAlbum) references Album(IDAlbum),
constraint FK_Brano foreign key (IDBrano) references Brano(IDBrano),
constraint PK_AlbumBrano primary key (IDAlbum,IDBrano)
)

--inserimento dati
--inserimento dentro brano
insert into Brano values ('la dura legge del gol',190)
insert into Brano values ('Regina delle celebrità',160)
insert into Brano values ('Come mai',185)
insert into Brano values ('Zitti e buoni',100)
insert into Brano values ('Imagine', 200)
insert into Brano values ('Riccione', 500)
insert into Brano values ('Vocale', 300)
insert into Brano values ('We are the Champions', 600)
--inserimento dentro band
insert into Band values ('883',4)
insert into Band values ('The giornalisti',6)
insert into Band values ('Maneskin',5)
insert into Band values ('the Beatles',5)
insert into Band values ('Queen',6)
select*from Band
--inserimento dentro album
insert into Album values ('Gli anni d''oro',1996,'Sony','Pop','CD',1)
insert into Album values ('Come mai',1998,'Sony','Pop','vinile',1)
insert into Album values ('Brutti',2018,'Music','Jazz','Vinile',3)
insert into Album values ('Ciao',2017,'Music','Metal','Streaming',3)
insert into Album values ('Torna',2020,'Sony','Pop','CD',3)
insert into Album values ('World',1980,'WWW','Classico','Vinile',5)
insert into Album values ('Felicita',2021,'Gita','pop','Vinile',2)

select*from Album
select*from Brano
--inserimento dentro AlbumBrano
insert into AlbumBrano values (1,1)
insert into AlbumBrano values (3,3)
insert into AlbumBrano values (6,4)
insert into AlbumBrano values (11,5)
insert into AlbumBrano values (15,6)
insert into AlbumBrano values (15,5)
insert into AlbumBrano values (15,8)



--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;
select a.Titolo
from Album a join Band b on a.IDBand=b.IDBand
where b.Nome='883'
order by a.Titolo

--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;

select*
from Album a
where a.CasaDiscografica='Sony Music' and a.AnnoDiUscita=2020

--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti ad album pubblicati prima del 2019;
select br.Titolo
from Band b join Album a on b.IDBand=a.IDBand
            join AlbumBrano ab on ab.IDAlbum=a.IDAlbum
			join Brano br on br.IDBrano=ab.IDBrano
where b.Nome='Maneskin' and a.AnnoDiUscita<2019

--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;
select a.Titolo
from Album a join AlbumBrano ab on ab.IDAlbum=a.IDAlbum
			join Brano br on br.IDBrano=ab.IDBrano
where br.Titolo='Imagine'

--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;
select count(br.titolo) as [Canzoni eseguite]
from Band b join Album a on b.IDBand=a.IDBand
            join AlbumBrano ab on ab.IDAlbum=a.IDAlbum
			join Brano br on br.IDBrano=ab.IDBrano
where b.Nome='The Giornalisti'

--6) Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani
select a.IDAlbum, sum(br.Durata) as[tot sec album]
from Album a join AlbumBrano ab on ab.IDAlbum=a.IDAlbum
			join Brano br on br.IDBrano=ab.IDBrano
group by a.IDAlbum

--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i secondi quindi 180 s).
select distinct br.Titolo
from Band b join Album a on b.IDBand=a.IDBand
            join AlbumBrano ab on ab.IDAlbum=a.IDAlbum
			join Brano br on br.IDBrano=ab.IDBrano
where b.Nome='883' and br.Durata>180

--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.
select b.Nome
from Band b
where b.Nome like 'M%' and b.Nome like '%n'

--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980,
--‘New Entry’ se l’anno di uscita è il 2021,
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020,
--‘Old’ altrimenti.

select a.Titolo, 
CASE
when a.AnnoDiUscita<1980 then 'Very Old'
when a.AnnoDiUscita=2021 then 'New Entry'
when a.AnnoDiUscita between 2010 and 2020 then 'Recente'
else 'Old'
end as [Anzianità album]
from Album a


--10) Mostrare i brani non contenuti in nessun album.
select br.Titolo
from Brano br
where br.IDBrano not in (select ab.IDBrano from AlbumBrano ab)


--RISPOSTE DOMANDE TEORIA
--1) b/c
--2) L associazione molti a molti si traduce nel database con un create table di una tabella di appoggio che avra le sue primary key le
--quali possono essere foreign key ognuna delle quali associata alla tabella di appartenenza, più eventuali attributi riferiti alla
--relazione nel modello concettuale
--3)b
--4)b
--5)b