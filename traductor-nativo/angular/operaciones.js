window.onload = function()
{
    angular.element( document.getElementById( 'texto-cargar')).scope().cargar_datos();

    angular.element( document.getElementById( 'texto-cargar' )).scope().otra_funcion();
}

var app = angular.module( "apptraductor", [] );

app.controller( "controlador", 

    [ "$scope", "$http", //inyeccion de dependecias.

        function( $scope, $http ){ //----------MAXIMA, no se deba tocar-----------------
            //console.log("real");
            $scope.cargar_datos = function()
            {
                //console.log($scope.mitexto);
                //console.log("real");
                var lin = 'angular/buscador_informe.php';
                console.log(lin);  
                $http.get( lin ).then( //-----------datos--------
                    
                
                    function( response )
                    {
                        console.log(lin); 
                       // console.log('datos.php?mivalor=' + $scope.mitexto + "&in=1&fn=10");
                        $scope.informacion = response.data;
                        console.log(response.data);
                        //console.log( $scope.informacion);
                        //console.log($scope.$salida);
                    }
                   
                );//--------fin datos---
            }
           
        }//-----------FIN del MAXIMA-------------------
    ]

);

function obtenerclase()
