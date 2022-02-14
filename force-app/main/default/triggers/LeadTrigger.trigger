trigger LeadTrigger on Lead (after insert, after update, before insert) {
    //buenas practicas
    //siempre que usemos trigger utilizamos classes handler para que sea mas facil la lectura.

    //Trigger.new devuelve una lista del sObject seleccionado en el trigger (lead en este caso) de los registros que se están procesando en un dml
    //Trigger.newMap nos devuelve un mapa de id sObject, siendo la clave el id del registro y el sObject el seleccionado del trigger con los datos que se estan procesando en el dml. (no se puede usar en before insert)
    //Trigger.old obtiene los datos sin la nueva actualizacion que se procesó en el dml.
    //Trigger.oldMap nos devuelve un mapa de id sObject siendo la clave el id del registro y el sObject el seleccionado.



    if(Trigger.isAfter){
        if(Trigger.isInsert){
            LeadTriggerHandler.createTasksRelated(Trigger.new)
        }else if(Trigger.isUpdate){
            List<Lead> leadWithOtherEmail = new List<Lead>();
            for(Lead aLead : Trigger.new){
                Lead oldLead = Trigger.oldMap.get(aLead.id);
                if(aLead.Email != oldLead.Email){
                    leadWithOtherEmail.add(aLead);
                }
            }
        }
    }else if(Trigger.isBefore){
        if(Trigger.isInsert){

        }
    }
}