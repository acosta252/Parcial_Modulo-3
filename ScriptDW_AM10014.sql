CREATE TABLE dim_aerolinea (
    airlineKey INT PRIMARY KEY IDENTITY(1,1),
    airlineCode NVARCHAR(100), -- Código de aerolínea
    description NVARCHAR(100)
);

-- Dimension de fecha
CREATE TABLE dim_fecha (
    fechaKey INT PRIMARY KEY,
    fullDate VARCHAR(10),
    nombreDia VARCHAR(25),
    diaDeSemana INT,
    numDiaEnMes INT,
    mes INT,
    nombreMes VARCHAR(25),
    numSemanaEnMes INT,
    numSemanaEnAnio INT,
    trimestre INT,
    nombreTrimestre VARCHAR(25),
    diaLaboral VARCHAR(3), -- Lunes a viernes, 0 no, 1 si
    anio INT
);

-- Fact table de vuelos
CREATE TABLE factvuelos (
    fechaKey INT,
    airlineKey INT,
    flightNumberOperatingAirline INT,
    -- Origen
    originAirportID INT, -- ID aeropuerto origen 
    originCityName VARCHAR(100),
    originState VARCHAR(10),
    originStateName VARCHAR(100),
    -- Destino
    destAirportID INT, -- ID aeropuerto destino 
    destCityName VARCHAR(100),
    destState VARCHAR(10),
    destStateName VARCHAR(100),
    crsDepTime INT,
    depTime INT,
    delayed VARCHAR(3), -- Retrasado
    depDelayMinutes INT,
    arrDelayMinutes INT,
    wheelsOff INT,
    wheelsOn INT,
    crsArrTime INT,
    arrTime INT,
    canceled INT, -- Cancelado
    diverted INT, -- Desviado
    crsElapsedTime INT,
    actualElapsedTime INT,
    airtime INT, -- Tiempo en el aire
    carrierDelay INT, -- Retraso del transportista
    weatherDelay VARCHAR(10), -- Retraso de clima
    nasDelay VARCHAR(10), -- National Air System Delay
    securityDelay VARCHAR(10), -- Retraso de seguridad
    lateAircraftDelay VARCHAR(10), -- Retraso tardío de la aeronave
    divAirportLandings INT, -- Numero de aterrizajes en aeropuertos diferentes
    divReachedDest VARCHAR(10), -- Vuelos desviados que llegaron a destino
    divActualElapsedTime VARCHAR(10),
    divArrDelay VARCHAR(10),
    FOREIGN KEY (airlineKey) REFERENCES dim_aerolinea(airlineKey),
    FOREIGN KEY (fechaKey) REFERENCES dim_fecha(fechaKey)
);
