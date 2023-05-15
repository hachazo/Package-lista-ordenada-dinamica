generic
   
   type Telemento is private;
 
   with function "=" (X,Y: Telemento) return Boolean;
   with function "<" (X,Y: Telemento) return Boolean;
   with function ">" (X,Y: Telemento) return Boolean;
   
   package Listaordenada is
      
      type Tipolista is private;
      
      function Vacia(Lista: Tipolista) return Boolean;      
      function Esta(Lista: Tipolista; Elemento:Telemento) return Boolean;      
      procedure Insertar(Lista: in out Tipolista; Elemento: in Telemento);      
      procedure Suprimir(Lista: in out Tipolista; Elemento: in Telemento);      
      procedure Limpiar(Lista: in out Tipolista);      
      function Info(Lista: in Tipolista) return Telemento;      
      function Sig(Lista: in Tipolista) return Tipolista;      
      Listavacia: exception;      

      private
      type Tiponodo;
      type Tipolista is access Tiponodo;
      type Tiponodo is record
         Info: Telemento;
         Sig: Tipolista;
      end record;
      
   end Listaordenada;
   --package Listaint is new Listaordenada(Integer,"=","<",">");
   --use ListaInt;
   --listaordenada: tipolista;
   
