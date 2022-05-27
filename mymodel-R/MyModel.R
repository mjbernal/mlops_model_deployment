library(methods)
library(caret)
library(mlbench)

predict.mymodel <- function(mymodel,newdata=list()) {

  # Extraer el individuo a consultar
  individuo<-newdata[[1]][1]

  # Cargar los datos y hacer la partición
  data("PimaIndiansDiabetes") 
  pima.Datos = PimaIndiansDiabetes
  pima.Var.Salida.Usada = c("diabetes")
  set.seed(1234)
  pima.TrainIdx.80<-createDataPartition(pima.Datos[[pima.Var.Salida.Usada]],p=0.8,list = FALSE,times = 1)
  pima.Datos.Train<-pima.Datos[pima.TrainIdx.80,]

  # Predict
  write(predict(mymodel$model,pima.Datos.Train[individuo,]), "\n", stdout())
}


new_mymodel <- function() {
    model <- readRDS("modeloknnPima.rds")
    structure(list(model=model), class = "mymodel")
}


initialise_seldon <- function(params) {
    new_mymodel()
}
