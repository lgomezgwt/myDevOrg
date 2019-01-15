public class groupsFilteringController {
    public String roleID { get; set; }
    public String roleName { get; set; }
    public List<Group> roleList { get; set; }
    public List<GroupMember> groupList { get; set; }
    public List<String> roleRelatedGroupsIds { get; set; } 
    public List<String> relatedGroupIds { get; set; }
    
    public groupsFilteringController() {
        init();
    }
    
    public void init() {
        roleRelatedGroupsIds = new List<String> ();
        relatedGroupIds = new List<String> ();
        
        roleList = [SELECT id, RelatedId, Type 
                     FROM Group 
                     WHERE RelatedId =: UserInfo.getUserRoleId()];
        
        for(Group roleItem : roleList) {
            roleRelatedGroupsIds.add(roleItem.Id);
        }
        
        groupList = [SELECT Id, group.id, group.name, group.type 
                     FROM GroupMember 
                     WHERE UserOrGroupId =: UserInfo.getUserId()];
        
        system.debug('Lista Vacía: ' + groupList.isEmpty());
        
        if(groupList.isEmpty()) {
            relatedGroupIds.add('The query did not return any querys.');
        } else {
            for(GroupMember groupItem : groupList) {
            	system.debug('Group Item: ' + groupItem);
                //relatedGroupIds.add(groupItem.groupID.Name);
        	}
        }
        
        if(UserInfo.getUserRoleId() == NULL) {
            roleID = 'isNULL';
            roleName = 'isNull';
        } else {
            roleID = UserInfo.getUserRoleId();
        }
        
        System.debug('Test.');
    }
}