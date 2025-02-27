let
    // Definir los años a consultar
    Anios = {2020..2027},  // Lista de años desde 2020 hasta 2027

    // Función para obtener los días festivos de un año específico
    ObtenerFestivos = (anio as number) as table =>
        let
            // URL de la API de Calendarific
            url = "https://calendarific.com/api/v2/holidays",
            parametros = [
                api_key = "Tu API KEy",  // Reemplaza con tu API Key de Calendarific
                country = "CO",              // Código de país para Colombia
                year = Number.ToText(anio)   // Año actual en el bucle
            ],
            // Hacer la solicitud a la API
            respuesta = Web.Contents(url, [Query = parametros]),
            // Convertir la respuesta JSON en una tabla
            datos = Json.Document(respuesta),
            festivos = datos[response][holidays],
            // Convertir la lista de festivos en una tabla
            tabla = Table.FromList(festivos, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
            // Expandir las columnas relevantes
            expandir = Table.ExpandRecordColumn(tabla, "Column1", {"name", "date", "type", "description"}, {"Nombre (Inglés)", "Fecha", "Tipo", "Descripción"}),
            // Agregar una columna para el año
            agregarAnio = Table.AddColumn(expandir, "Año", each anio)
        in
            agregarAnio,

    // Llamar a la función para cada año y combinar los resultados
    festivosCombinados = Table.Combine(List.Transform(Anios, each ObtenerFestivos(_))),

    // Función para traducir texto usando la API de Google Translate (opcional)
    TraducirTexto = (texto as text) as text =>
        let
            urlTraduccion = "https://translate.googleapis.com/translate_a/single",
            parametrosTraduccion = [
                client = "gtx",
                sl = "en",  // Idioma origen: inglés
                tl = "es",  // Idioma destino: español
                dt = "t",
                q = texto
            ],
            respuestaTraduccion = Web.Contents(urlTraduccion, [Query = parametrosTraduccion]),
            datosTraduccion = Json.Document(respuestaTraduccion),
            textoTraducido = datosTraduccion{0}{0}{0}
        in
            textoTraducido,

    // Traducir los nombres de los festivos al español (opcional)
    traducirNombres = Table.AddColumn(festivosCombinados, "Nombre (Español)", each TraducirTexto([#"Nombre (Inglés)"])),
    expandirFecha =  Table.TransformColumns(
    Table.ExpandRecordColumn(traducirNombres, "Fecha", {"iso"}, {"Date"}),
    {{"Date", each Text.BeforeDelimiter(_, "T"), type text}}
),
    #"Changed Type" = Table.TransformColumnTypes(expandirFecha,{{"Date", type date}}),
    #"Extracted Values" = Table.TransformColumns(#"Changed Type", {"Tipo", each Text.Combine(List.Transform(_, Text.From)), type text}),
    #"Removed Other Columns" = Table.SelectColumns(#"Extracted Values",{"Date", "Tipo", "Descripción", "Nombre (Español)"})
in
    #"Removed Other Columns"