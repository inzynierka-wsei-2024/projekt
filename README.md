# Projekt na inżynierkę

## Generowanie IAC terraform

Aby wygenerować IAC dla terraforma, należy użyć komendy `aztfexport resource-group p1-data-analysis` z [aztfexport](https://github.com/Azure/aztfexport)


## Infrastruktura

Infrastruktura do projektu jest zlokalizowana w azure: **japan-real-estate**. Data factory jest dostępna pod **japan-datafactory**

### Zasoby Azure

- storage account - blob z hierarchical storage
- sql server
- sql database
- data factory + arm template
- azure machine learning workspace
- event grid (?)

## MLOps

Do trenowania modeli wykorzystujemy usługę _Azure Machine Learning workspace_: **japan-ml**. 