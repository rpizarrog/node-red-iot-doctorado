# Node-RED IoT Doctorado

Configuración de Node-RED en la nube para el proyecto:

**Sistema IoT inteligente de detección de presencia y anomalías**

Proyecto desarrollado para la asignatura **Conectividad y Dispositivos de Sensores**.

## Objetivo

Desplegar Node-RED en Render mediante Docker, incorporando el Flow del sistema IoT y sus dependencias para permitir la reconstrucción automática del entorno cuando el contenedor sea reiniciado o desplegado nuevamente.

## Arquitectura

ESP32 / Wokwi  
↓  
Broker MQTT  
↓  
Node-RED en Render  
↓  
Dashboard 2.0

El sistema también recibe los resultados del módulo de visión artificial basado en Python y YOLO.

## Archivos del repositorio

### Dockerfile

Define la construcción del contenedor Docker basado en la imagen oficial de Node-RED.

### flows.json

Contiene el Flow de Node-RED utilizado por el sistema IoT.

Incluye el procesamiento de:

- Temperatura
- Humedad
- Distancia
- Luminosidad
- Movimiento PIR
- Inferencia mediante lógica difusa
- Estado de alarma
- Resultados de visión artificial
- Dashboard de monitoreo

### package.json

Define las dependencias adicionales requeridas por Node-RED.

Actualmente se utiliza:

- `@flowfuse/node-red-dashboard` versión `1.31.0`

## Dashboard

El Dashboard permite visualizar:

- Información del servidor
- Temperatura
- Humedad
- Distancia
- Luminosidad
- Estado del sensor PIR
- Evaluación del sistema inteligente
- Resultados de visión artificial

## Persistencia del Flow

Render Free utiliza almacenamiento efímero.

Por esta razón, el Flow no depende exclusivamente del directorio `/data` generado durante la ejecución del contenedor.

El archivo `flows.json` se mantiene versionado en GitHub y se incorpora durante la construcción de la imagen Docker.

De esta manera, cuando Render reconstruye el servicio, el Flow puede ser incorporado nuevamente al contenedor.

> Esta estrategia permite reconstruir la configuración base de Node-RED, pero no convierte el almacenamiento efímero de Render Free en almacenamiento persistente.

## Almacenamiento CSV

En el entorno local se puede utilizar una ruta de Windows para almacenar el archivo CSV.

En Render se utiliza una ruta Linux:

`/data/datos_iot_distancia_luminosidad_estado.csv`

El almacenamiento en `/data` de una instancia gratuita de Render no debe considerarse permanente. Para almacenamiento histórico persistente se contempla posteriormente utilizar una base de datos en la nube.

## Tecnologías

- Node-RED
- Dashboard 2.0 / FlowFuse
- Docker
- Render
- GitHub
- MQTT
- ESP32
- MicroPython
- Python
- YOLO
- Lógica difusa

## Autor

**Rubén Pizarro Gurrola**

Doctorado en Tecnologías de la Información