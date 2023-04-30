with Ada.Unchecked_Deallocation;

package body Listaordenada is
   
   procedure Free is new Ada.Unchecked_Deallocation(Tiponodo,nodolista);
   
   -- Insertar elemento
   procedure Insertar(Lista: in out nodolista; Elemento: in Tipoelemento) is
      Nuevonodo:nodolista:= new Tiponodo'(Elemento,null);
      Ptr, Ant: nodolista;
      Lugarencontrado:Boolean;
   begin
      if Vacia(Lista) then 
         Lista:=Nuevonodo;
      else
         if Elemento<Lista.Info then 
            Nuevonodo.Sig:=Lista;
            Lista:= Nuevonodo;
         else
            Ptr:=Lista;
            Lugarencontrado:= False;
            while not Lugarencontrado and Ptr/=null loop
               if Elemento > Ptr.Info then
                  Ant:= Ptr;
                  Ptr:= Ptr.Sig;
               else Lugarencontrado:= True;
               end if;
            end loop;
            Nuevonodo.Sig:=Ptr;
            Ant.Sig:=Nuevonodo;
         end if;
      end if;
   end Insertar;
   

   
   -- Suprimir elemento
   procedure Suprimir (Lista: in out nodolista; Elemento: in Tipoelemento) is
      Actual:nodolista:=Lista;
      Ant: nodolista:=null;
   begin      
      while Actual/=null and Actual.Info<Elemento loop
         Ant:=Actual;
         Actual:=Actual.Sig;
      end loop;
      if Ant=null then
         Lista:=Lista.Sig;         
      else
         Ant.Sig:=Actual.Sig;
      end if;
      Free(Actual);
   end Suprimir;
   
        
   -- Limpiar elemento
   procedure Limpiar(Lista: in out nodolista) is
      Temp:nodolista:=Lista;     
   begin
      while Lista/=null loop
         Temp:=Lista;
         Lista:=Lista.Sig;
         Free(Temp);
      end loop;
   end Limpiar;
   

   
   function Info(Lista: in nodolista) return Tipoelemento is      
   begin
      if Lista/=null then return Lista.Info;
      else raise Listavacia;
      end if;
   end Info;
   

   
   -- chequea si esta el elemento
   function Esta(Lista:nodolista; Elemento:Tipoelemento) return Boolean is
      Ptr: nodolista:=Lista;
   begin
      if Vacia(Lista) then
         return False;
      else
         if Ptr/=null and Ptr.Info=Elemento then
            return True;
         else
            return Esta(Lista.Sig, Elemento);
         end if;
      end if;
   end Esta;
   

   
   function Vacia(Lista: in nodolista) return Boolean is
   begin
      return Lista=null;
   end Vacia;
   

   function Sig(Lista: nodolista) return nodolista is      
   begin
      if Vacia(Lista) then
         raise Listavacia;         
      else 
         return Lista.Sig;         
      end if;
   end Sig;
        
end Listaordenada;