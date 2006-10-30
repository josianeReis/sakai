<f:view>
<div class="portletBody">
<h:form id="editSectionForm">

    <sakai:flowState bean="#{editSectionBean}"/>

    <x:aliasBean alias="#{viewName}" value="editSection">
        <%@include file="/inc/navMenu.jspf"%>
    </x:aliasBean>
    
        <h3><h:outputText value="#{msgs.edit_section_page_header}"/></h3>
        
        <%@include file="/inc/globalMessages.jspf"%>
    
				<h:panelGrid columns="2" rowClasses="sectionRow">

					<% // Title %>

					<h:outputLabel for="titleInput" value="#{msgs.section_title} #{msgs.section_required}" styleClass="formLabel"/>
					<h:panelGroup>
						<x:div>
							<h:message for="titleInput" styleClass="validationEmbedded"/>
						</x:div>
						<h:inputText
							id="titleInput"
							required="true"
							value="#{editSectionBean.section.title}"/>
					</h:panelGroup>

					<% // Max Size %>

					<h:outputLabel for="maxEnrollmentInput" value="#{msgs.section_max_size}" styleClass="formLabel"/>
					<h:panelGroup>
						<x:div>
							<h:message for="maxEnrollmentInput" styleClass="validationEmbedded"/>
						</x:div>
						<h:inputText id="maxEnrollmentInput" value="#{editSectionBean.section.maxEnrollments}"/>
					</h:panelGroup>

					<% // Logistics %>
					
					<h:outputLabel value="#{msgs.section_logistics}" styleClass="formLabel"/>
					<h:dataTable id="meetingsTable" value="#{editSectionBean.section.meetings}" var="meeting">
					
						<% // One column per meeting.  Use a div to add a line break in the form controls %>
						<h:column>
							<h:panelGroup>
								<x:div>
									<h:selectBooleanCheckbox id="monday" value="#{meeting.monday}"/>
									<h:outputLabel for="monday" value="#{msgs.day_of_week_monday}"/>
						
									<h:selectBooleanCheckbox id="tuesday" value="#{meeting.tuesday}"/>
									<h:outputLabel for="tuesday" value="#{msgs.day_of_week_tuesday}"/>
						
									<h:selectBooleanCheckbox id="wednesday" value="#{meeting.wednesday}"/>
									<h:outputLabel for="wednesday" value="#{msgs.day_of_week_wednesday}"/>
						
									<h:selectBooleanCheckbox id="thursday" value="#{meeting.thursday}"/>
									<h:outputLabel for="thursday" value="#{msgs.day_of_week_thursday}"/>
						
									<h:selectBooleanCheckbox id="friday" value="#{meeting.friday}"/>
									<h:outputLabel for="friday" value="#{msgs.day_of_week_friday}"/>
						
									<h:selectBooleanCheckbox id="saturday" value="#{meeting.saturday}"/>
									<h:outputLabel for="saturday" value="#{msgs.day_of_week_saturday}"/>
						
									<h:selectBooleanCheckbox id="sunday" value="#{meeting.sunday}"/>
									<h:outputLabel for="sunday" value="#{msgs.day_of_week_sunday}"/>
								</x:div>
	
								<x:div>
									<h:outputFormat value="#{msgs.section_start_time}"/>
									<h:panelGroup>
										<x:div>
											<h:message for="startTime" styleClass="validationEmbedded"/>
										</x:div>
										<h:inputText id="startTime" value="#{meeting.startTimeString}" size="8"/>
										<x:selectOneRadio id="startTimeAm" layout="spread" value="#{meeting.startTimeAmString}">
											<f:selectItem itemValue="true" itemLabel="#{msgs.time_of_day_am_cap}"/>
											<f:selectItem itemValue="false" itemLabel="#{msgs.time_of_day_pm_cap}"/>
										</x:selectOneRadio>
										<x:radio for="startTimeAm" index="0" />
										<x:radio for="startTimeAm" index="1" />
									</h:panelGroup>
				
									<h:outputLabel for="endTime" value="#{msgs.section_end_time}"/>
									<h:panelGroup>
										<x:div>
											<h:message for="endTime" styleClass="validationEmbedded"/>
										</x:div>
										<h:inputText  id="endTime" value="#{meeting.endTimeString}"  size="8"/>
										<x:selectOneRadio id="endTimeAm" layout="spread" value="#{meeting.endTimeAmString}">
											<f:selectItem itemValue="true" itemLabel="#{msgs.time_of_day_am_cap}"/>
											<f:selectItem itemValue="false" itemLabel="#{msgs.time_of_day_pm_cap}"/>
										</x:selectOneRadio>
										<x:radio for="endTimeAm" index="0" />
										<x:radio for="endTimeAm" index="1" />
									</h:panelGroup>
		
									<h:outputLabel for="location" value="#{msgs.section_location}"/>
									<h:panelGroup>
										<h:inputText id="location" value="#{meeting.location}" maxlength="20" />
										<x:div>
											<h:outputText value=" #{msgs.section_location_truncation} "/>
										</x:div>
									</h:panelGroup>
								</x:div>
							</h:panelGroup>
						</h:column>
					</h:dataTable>

					<% // placeholder for the missing label for the 'add meeting' link %>
					<h:outputText value=""/>
					<h:commandLink actionListener="#{editSectionBean.processAddMeeting}" immediate="true">
						<h:outputText value="#{msgs.add_section_add_meeting}"/>
					</h:commandLink>

				</h:panelGrid>

    <x:div styleClass="act">
        <h:commandButton
        	action="#{editSectionBean.update}"
        	value="#{msgs.section_update}"
        	styleClass="active" />
        <h:commandButton action="overview" value="#{msgs.section_cancel}" immediate="true" />
    </x:div>
</h:form>
</div>
</f:view>
