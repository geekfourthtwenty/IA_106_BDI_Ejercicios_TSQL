USE Olimpiadas
GO

CREATE TABLE Menu
(
	IdMenu INT,
	Nombre VARCHAR(20),
	IdMenuPadre INT,
	CONSTRAINT PK_Menu_IdMenu
	PRIMARY KEY (IdMenu),
	CONSTRAINT FK_Menu_Menu
	FOREIGN KEY (IdMenuPadre)
	REFERENCES Menu(IdMenu)
)