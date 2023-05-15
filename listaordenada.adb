with Ada.Unchecked_Deallocation;

package body Listaordenada is
   
   procedure Free is new Ada.Unchecked_Deallocation(Tiponodo,Tipolista);
   
   procedure Insertar(Lista: in out Tipolista; Elemento: in Telemento) is
      Nuevonodo:Tipolista:= new Tiponodo'(Elemento,null);
      Ptr, Ant: Tipolista;
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
   

   
   procedure Suprimir (Lista: in out Tipolista; Elemento: in Telemento) is
      Actual:Tipolista:=Lista;
      Ant: Tipolista:=null;
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
   
        
   procedure Limpiar(Lista: in out Tipolista) is
      Temp:Tipolista:=Lista;     
   begin
      while Lista/=null loop
         Temp:=Lista;
         Lista:=Lista.Sig;
         Free(Temp);
      end loop;
   end Limpiar;
   


   function Info(Lista: in Tipolista) return Telemento is      
   begin
      if Lista/=null then return Lista.Info;
      else raise Listavacia;
      end if;
   end Info;
   

   

   function Esta(Lista:Tipolista; Elemento:Telemento) return Boolean is
      Ptr: Tipolista:=Lista;
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
   

   
   function Vacia(Lista: in Tipolista) return Boolean is
   begin
      return Lista=null;
   end Vacia;
   

   function Sig(Lista: Tipolista) return Tipolista is      
   begin
      if Vacia(Lista) then
         raise Listavacia;         
      else 
         return Lista.Sig;         
      end if;
   end Sig;
        
end Listaordenada;
   
   


