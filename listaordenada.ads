generic
   
   type Tipoelemento is private; -- elemento del programa principal
   
   with function "<" (X, Y: Tipoelemento) return Boolean;
   with function ">" (X, Y: Tipoelemento) return Boolean;
   with function "=" (X, Y: Tipoelemento) return boolean;
   package Listaordenada is
   
      type Nodolista is private;
      
   function Vacia(Lista: Nodolista) return Boolean;      
   function Esta(Lista: Nodolista; Elemento:Tipoelemento) return Boolean; 
        
   procedure Insertar(Lista: in out Nodolista; Elemento: in Tipoelemento);      
   procedure Suprimir(Lista: in out Nodolista; Elemento: in Tipoelemento);      
   procedure Limpiar(Lista: in out Nodolista);     
    
   function Info(Lista: in Nodolista) return Tipoelemento;
   function Sig(Lista: in Nodolista) return Nodolista;  

      Listavacia: exception;
   
   private
   
   type tiponodo; --Declaracion incompleta
   type Nodolista is access tiponodo; -- Defino el tipo de dato que va a tener el puntero

   type tiponodo is record
      Info: Tipoelemento;
      Sig: Nodolista;
   end record;
   
   end listaordenada;
   
-- function Menor(X, Y: Emedico) return Boolean;
-- function Mayor(X, Y: Emedico) return Boolean;
-- package listainc is new listaordenada(Emedico,menor,mayor);
-- use listainc
-- Lista:Nodolista; 