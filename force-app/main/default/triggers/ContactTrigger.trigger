trigger ContactTrigger on Contact (after insert) {
    List<Contact> conList = trigger.new;
}