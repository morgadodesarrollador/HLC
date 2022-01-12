-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-01-2021 a las 11:29:15
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreriabck`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--
CREATE DATABASE libreria;
USE libreria;
CREATE TABLE `categorias` (
  `categoriaid` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoriaid`, `nombre_categoria`) VALUES
(1, 'Programaci�n'),
(2, 'Bases de datos'),
(3, 'Multimedia'),
(4, 'Internet');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedidos`
--

CREATE TABLE `detallepedidos` (
  `CodigoLibro` int(11) NOT NULL,
  `CodigoUsuario` int(10) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `descuento` decimal(15,2) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editores`
--

CREATE TABLE `editores` (
  `editorid` int(11) NOT NULL,
  `nombre_editorial` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `editores`
--

INSERT INTO `editores` (`editorid`, `nombre_editorial`) VALUES
(1, 'Anaya multimedia'),
(2, 'MC Grad Hill'),
(3, 'Para-info'),
(4, 'Parafox');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `libro_id` int(11) NOT NULL,
  `nombre_libro` varchar(100) NOT NULL DEFAULT '',
  `descripcion` longtext NOT NULL,
  `categoriaid` int(11) NOT NULL DEFAULT '0',
  `editorid` int(11) NOT NULL DEFAULT '0',
  `precio` double NOT NULL DEFAULT '0',
  `entrega` int(11) NOT NULL DEFAULT '0',
  `imagen` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`libro_id`, `nombre_libro`, `descripcion`, `categoriaid`, `editorid`, `precio`, `entrega`, `imagen`) VALUES
(1, 'PREMIERE PRO', 'La colecci�n Manuales Imprescindibles le acerca a los productos l�deres de la inform�tica de forma amena y precisa. Como su nombre indica, encontrar� la informaci�n imprescindible para convertirse en un experto usuario en los temas m�s importantes de cada aplicaci�n. No dude m�s, observe la lista de esta articulada colecci�n, con lenguaje  propio, ejemplos pr�cticos y recursos de estilo muy marcados.', 3, 2, 21.85, 5, 'premiere01.jpg'),
(2, 'POSTPRODUCCI�N DIGITAL DE SONIDO POR ORDENADOR', 'Este libro analiza una completa panor�mica sobre el trabajo de postproducci�n digital de sonido por ordenador. La obra explica los programas m�s conocidos del mercado y est� escrita de forma clara y concisa, lo que la convierte en un manual imprescindible tanto para el usuario principiante interesado en la manipulaci�n de sonido por medio de ordenador, como para el profesional que desee profundizar en el estudio de este campo.', 3, 1, 14.25, 5, 'producionsonido.jpg'),
(4, 'EL LIBRO OFICIAL DE ADOBE ILLUSTRATOR CS', 'Este libro forma parte de la serie de formaci�n oficial de Adobe Systems Incorporated, desarrollada con la colaboraci�n de sus expertos. Se compone de diecinueve cap�tulos que analizan los aspectos m�s importantes de Illustrator CS, con excelentes t�cnicas y trucos para desarrollar sus proyectos de forma efectiva.', 3, 2, 36.32, 5, 'ilustratos.jpg'),
(5, 'PHOTOSHOP CS CURSO COMPLETO', 'Este libro le ense�ar� a utilizar Photoshop para crear im�genes de calidad profesional. Tanto si es usted aficionado a la fotograf�a como si es un futuro dise�ador gr�fico, encontrar� aqu� la gu�a m�s directa para dominar Photoshop r�pidamente y sin esfuerzo. Tras el �xito de las versiones precedentes del libro Photoshop Superf�cil y para satisfacer a los lectores m�s avanzados, se publica esta obra que profundiza m�s en Photoshop y descubre nuevas posibilidades. Los ejercicios han sido dise�ados espec�ficamente para reforzar y clarificar los contenidos del libro, y permiten practicar los conceptos y t�cnicas a medida que los lea.', 3, 1, 37.25, 15, 'photoshop02.jpg'),
(6, 'DISE�O DE INTERFAZ DE USUARIO PARA APLICACIONES WINDOWS', 'Aqu� encontrar� las directrices oficiales de Microsoft, revisadas y actualizadas, para la creaci�n de interfaces de usuario bien dise�adas y coherentes para aplicaciones que se ejecuten en la familia de sistemas operativos Microsoft Windows, en la que se incluyen Windows 98 y Windows 2000. Es un manual esencial para todos los programadores y dise�adores que trabajen con las �ltimas versiones de Windows y Microsoft Explorer.', 3, 3, 40.1, 5, 'interfaz.jpg'),
(7, 'GU�A DE APRENDIZAJE PDF CON ACROBAT 5', 'Un m�todo sencillo y visual de aprender Adobe Acrobat 5, utilizando im�genes que le guiar�n por la aplicaci�n y le mostrar�n lo que debe hacer. Esta gu�a funciona tambi�n como un libro de referencia. Busque lo que necesita y empiece a trabajar.', 3, 4, 21.75, 5, 'pdf.jpg'),
(9, 'INTRODUCCI�N A LA PROGRAMACI�N ORIENTADA A OBJETOS CON VISUAL BASIC.NET', 'A medida que avance en la lectura de este libro, aprender� c�mo analizar los requisitos empresariales de una aplicaci�n, c�mo modelar los objetos y las relaciones implicadas en el dise�o elegido y, por �ltimo, c�mo implementar la aplicaci�n utilizando Visua Basic .NET. Tambi�n aprender� los fundamentos del dise�o de software, del Lenguaje de Modelado Unificado, de la programaci�n orientada a  objetos y de Visual Basic. NET.', 1, 2, 31.52, 5, 'programacion-objetos01.jpg'),
(10, 'JAVASCRIPT', '�Con JavaScript puede construir sitios mejores y de funcionamiento m�s inteligente que antes! Ahora puede aprender JavaScript de la mano de tres importantes desarrolladores web. Aprender� todo lo que necesita para obtener resultados a medida que construye sitios reales dedicados a vender productos, ense�ar a los visitantes, ofrecer suscripciones y visualizar anuncios.', 1, 4, 29.2, 15, 'javascript01.jpg'),
(11, 'FLASH 5 ACTION SCRIPT STUDIO: CURSO DE PROGRAMACI�N', 'Este libro est� dividido en tres secciones, en las que se tratar�n las t�cnicas principales, la especializaci�n,  y los casos de estudio. El objetivo primario es ense�ar los fundamentos  de ActionScript despu�s entrar en mayores detalles. Tambi�n se explorar�n los siguientes temas: C�mo las t�cnicas orientadas a objetos pueden resultar una herramienta valiosa para los dise�adores y para los programadores. Obtenci�n del  control del aspecto, sonido y comportamiento de las interfaces animadas que se crean. Uso de XML para controlar el contenido y la apariencia de nuestras pel�culas  y para importar la informaci�n desde fuentes externas.', 1, 3, 23.37, 5, 'flash01.jpg'),
(12, 'CURSO DE PROGRAMACI�N', 'Una de las caracter�sticas comunes que en la actualidad tiene la programaci�n es la elecci�n del paradigma imperativo. Sin embargo, se ha decidido proponer una alternativa al orden expositivo cl�sico al presentar una metodolog�a de trabajo que pasa, en primer lugar, por el dise�o de los programas en un lenguaje algor�tmico para, una vez discutida y establecida la correcci�n de los mismos, traducirlos a un lenguaje compilable para su posterior ejecuci�n.', 1, 3, 18.2, 5, 'programacion01.jpg'),
(13, 'ORACLE DATABASE 10G.: GU�A DE APRENDIZAJE', 'Aprenda los conceptos fundamentales sobre administraci�n y programaci�n de Oracle Database 10g con esta gu�a de aprendizaje paso a paso. Conozca, a trav�s de los tutoriales did�cticos, los fundamentos de la base de datos, el papel que desempe�a el administrador y las principales caracter�sticas del producto. Tambi�n se proporciona una detallada introducci�n a la programaci�n en SQL, PL/SQL, Java y XML. Convi�rtase en un experto administrador, desarrollador o usuario de Oracle gracias al m�todo de aprendizaje contrastado de esta gu�a de Oracle Press.\r\n', 2, 3, 30.24, 15, 'oracle01.jpg'),
(14, 'MICROSOFT SQL SERVER 2000', 'SQL Server 2000 es la �ltima versi�n del ya conocido RDBMS de Microsoft, sucesor del exitoso SQL Server 7. Se trata de un servidor altamente escalable, muy fiable y de alto rendimiento, especialmente dirigido a los usuarios de sistemas operativos de Microsoft, como Windows NT o Windows 2000. Una gu�a �til e inagotable de datos, con la informaci�n m�s novedosa.', 2, 2, 13.25, 5, 'sql01.jpg'),
(15, 'MySQL', 'MySQL, el sistema de gesti�n de bases de datos relacional de c�digo abierto por excelencia, sigue ganando usuarios de manera asombrosa. Aunque ya es conocida su sencillez de uso y su velocidad, capaz de manejar grandes bases de datos con millones de registros, se ha mejorado a s� mismo para adaptarse especialmente al desarrollo de sitios web y aplicaciones basadas en bases de datos. Esta obra proporciona una gu�a exhaustiva para utilizar MySQL de una forma realmente efectiva y productiva, poniendo especial �nfasis en sus capacidades �nicas y el modo de utilizarlas. Encontrar� informaci�n fundamental sobre todo el proceso, desde los fundamentos b�sicos sobre c�mo obtener informaci�n de una base de datos y formular consultas, hasta c�mo emplear MySQL con PHP o Perl para generar p�ginas web din�micas o administrar servidores MySQL.', 2, 2, 55.7, 5, 'mysql01.jpg'),
(16, 'MICROSOFT SQL SERVER 2000: MANUAL DEL ADMINISTRADOR', 'Microsoft SQL Server 2000 es la referencia concisa y sencilla de utilizar para tratar con todos los detalles de la administraci�n de bases de datos Microsoft SQL Server 2000. Aprenda a analizar y monitorizar SQL Server, a llevar a cabo copias de seguridad y recuperaci�n, y a hacerse cargo de la automatizaci�n y el mantenimiento.', 2, 3, 36.68, 5, 'sql02.jpg'),
(17, 'E-LEARNING. IMPLANTACI�N DE PROYECTOS DE FORMACI�N ON-LINE', 'Los sistemas de formaci�n y los centros de ense�anza tradicionales se han visto sorprendidos por una nueva modalidad de aprendizaje que ofrece, a su favor, la posibilidad de llegar a mayor cantidad de usuarios y empleados, adecu�ndose a sus horarios sin limitaci�n geogr�fica y a un coste menor. El e-learning se apoya en las nuevas teor�as de gesti�n del conocimiento, seg�n las cuales, en entornos complejos, donde la innovaci�n y la velocidad de respuesta a los cambios son cruciales, las empresas no pueden crear valor sin generar conceptos nuevos en los que sus empleados han de formarse d�a a d�a. El reconocimiento de esta situaci�n, que se viene a denominar aprendizaje continuo, exige al sector educativo centrar el dise�o de sus estrategias formativas en una ense�anza constante a todos los miembros de la organizaci�n: empleados y alumnos.', 4, 1, 20.56, 5, 'elearning01.jpg'),
(18, 'SUPERUTILIDADES PARA WEBMASTERS', 'Este libro es una herramienta imprescindible para todas las personas relacionadas con la creaci�n de aplicaciones Web, o que quieran aprender a crearlas. Se tratan varias tecnolog�as y lenguajes, y se proporcionan utilidades que pueden ser incorporadas en los sitios Web que se est�n desarrollando. Va dirigido a programadores de p�ginas Web, analistas y dise�adores de sitios Web, Webmasters, y personas con conocimientos de programaci�n.', 4, 3, 24.54, 5, 'util01.jpg'),
(19, 'GOOGLE. LOS MEJORES TRUCOS', 'Desde el principio Google se ha diferenciado del resto de motores de b�squeda, en buena medida gracias a su tecnolog�a y a la extraordinaria relevancia de los resultados de sus b�squedas, as� como a la constante innovaci�n con utilidades como el API de Google, que proporciona a los programadores una forma de acceder a los resultados mediante preguntas automatizadas. Dado el gran tama�o del �ndice de Google, en ocasiones un tipo de b�squeda determinada obtiene demasiados resultados como para que sea eficaz. Tambi�n habr� veces en las que se necesite realizar una b�squeda que la interfaz actual no soporte. El objetivo de este libro es mostrarle aquellos trucos que le permiten optimizar al m�ximo  sus b�squedas, demostrarle lo que se puede hacer al automatizarlas con algunos conocimientos de programaci�n y descubrirle algunos de los servicios m�s olvidados del buscador. ', 4, 2, 32.63, 5, 'google01.jpg'),
(20, 'COMUNICACI�N EN INTERNET del 2006', 'Comunicaci�n en Internet es una obra ambiciosa que intenta aportar una visi�n realista y eminentemente pr�ctica sobre el panorama actual de las estrategias empresariales que utilizan Internet dentro de su proceso de marketing y comunicaci�n. El libro se sustenta en una estructura rigurosa que evita, en todo momento, tanto planteamientos coyunturales, como el oscurantismo terminol�gico t�pico del sector.', 4, 1, 21.98, 15, 'comunica01.jpg'),
(21, 'C�MO CREAR UNA TIENDA VIRTUAL CON PHP 5 Y MYSQL 5', 'Los objetivos del libro son:\r\n- Construir un sitio Web con una aplicaci�n de comercio electr�nico, que nos permitir� poner a la venta cualquier tipo de cat�logo de productos, y un foro de art�culos.\r\n- Ense�ar a dise�ar, desarrollar y programar un sitio web con el entorno AMP (Apache, MySQL y PHP).\r\n- Suministrar un paquete completo y funcional de dos aplicaciones Web integradas f�cilmente ampliables y personalizables.', 1, 4, 21.76, 5, 'php5.jpg'),
(22, 'SEGURIDAD EN INTERNET Y MEDIOS DE PAGO ELECTR�NICOS', 'Seguridad en Internet y medios de pago elect�nicos ofrece una ayuda simple y pr�ctica a las personas ocupadas que necesitan resultados inmediatos. A lo largo de sus lecciones, se orienta al usuario de la Red aclarando conceptos confusos y respondiendo a cuestiones b�sicas, porque el mayor fallo en la seguridad inform�tica suele ser la falta de informaci�n por la que a�n muchos miran a Internet de soslayo, con cierta inquietud.', 4, 4, 15.74, 15, 'seguridad.jpg'),
(23, 'INTERNET EN CASA', 'Internet en casa ayuda al lector a realizar todo lo que desee hacer en Internet: comprar, chatear, buscar informaci�n, jugar, compartir archivos, y de una forma f�cil, r�pida y eficaz. Es una gu�a de utilizaci�n diaria para aprender (y manejar con soltura) los aspectos pr�cticos de la Web, con informaci�n precisa y paso a paso que es inmediata de aplicar, desde como elegir un proveedor de Internet a proteger la privacidad personal en Internet, o c�mo hacer que el acceso a Internet sea seguro para nuestros hijos. El lenguaje empleado es sencillo y cercano a cualquier lector, sin jerga o terminolog�a excesiva, pero con el rigor t�cnico necesario para un aprendizaje bien fundado. Las notas r�pidas, las explicaciones paso a paso, y los ejemplos visuales que introducen al lector en la acci�n hacen de este libro uno de los m�s pr�cticos y �tiles del mercado.', 4, 4, 12.87, 5, 'internet01.jpg'),
(24, 'SERVICIOS GRATUITOS EN INTERNET PARA EL WEBMASTER', 'En este libro encontrar�s: C�mo encontrar lo que buscas en Internet, Telefonear casi gratis con Internet, Internet, El ordenador y sus secretos, El correo electr�nico. E-mail , La respuesta gracias a los grupos de discusi�n, Servicios gratuitos en Internet para todos y Servicios gratuitos de Internet para el webmaster.', 1, 4, 12.23, 15, 'servicios01.jpg'),
(25, 'qewr', 'erqwer', 1, 1, 45, 23, 'sdAAS'),
(26, 'qewr', 'erqwer', 1, 1, 45, 23, 'sdAAS'),
(27, 'HOLA', 'erqwer', 1, 1, 458, 23, 'sdAAS'),
(28, 'ORACLE', 'ASDAS', 2, 2, 6, 5, 'dSSD'),
(29, 'EL LIBRO DE LARAVEL', 'SDFASDF', 3, 4, 7, 7, 'ADFASDF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(10) NOT NULL,
  `LOGIN` varchar(25) NOT NULL,
  `PASS` varchar(25) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `APELLIDOS` varchar(40) NOT NULL,
  `ROL` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoriaid`);

--
-- Indices de la tabla `detallepedidos`
--
ALTER TABLE `detallepedidos`
  ADD PRIMARY KEY (`CodigoLibro`,`CodigoUsuario`),
  ADD KEY `CodigoUsuario` (`CodigoUsuario`);

--
-- Indices de la tabla `editores`
--
ALTER TABLE `editores`
  ADD PRIMARY KEY (`editorid`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`libro_id`),
  ADD KEY `LibrosCat` (`categoriaid`),
  ADD KEY `LibrosEdit` (`editorid`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `LOGIN` (`LOGIN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoriaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `editores`
--
ALTER TABLE `editores`
  MODIFY `editorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `libro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallepedidos`
--
ALTER TABLE `detallepedidos`
  ADD CONSTRAINT `detallepedidos_ibfk_1` FOREIGN KEY (`CodigoLibro`) REFERENCES `libros` (`libro_id`),
  ADD CONSTRAINT `detallepedidos_ibfk_2` FOREIGN KEY (`CodigoUsuario`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `CLibrosCat` FOREIGN KEY (`categoriaid`) REFERENCES `categorias` (`categoriaid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CLibrosEdit` FOREIGN KEY (`editorid`) REFERENCES `editores` (`editorid`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
