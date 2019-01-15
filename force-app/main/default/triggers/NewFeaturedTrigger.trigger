trigger NewFeaturedTrigger on SOBJECT (before insert) {
    return 'This is a new trigger!';
}