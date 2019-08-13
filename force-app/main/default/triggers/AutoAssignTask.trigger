//Trigger which AutoAssign Task when a new Opportunity is created
trigger AutoAssignTask on Opportunity (after insert, after update) {
List<Task> taskList = new List<Task>();
for (Opportunity opp : Trigger.new) {
  Task t   = new Task();
  t.Subject   = 'Give your prospect a free t-shirt';
  t.WhatId = opp.Id;
  taskList.add(t);
  system.debug('Opportunity ID is+++++++++++'+opp );
  system.debug('Before insert+++++++++++'+taskList); 
}
insert taskList;  // Notice this is outside the loop
 system.debug('after insert or after update +++++++++++'+taskList);

}