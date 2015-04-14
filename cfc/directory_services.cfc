
<cfcomponent rest="true">   
	<cfset dsn = "contactsdemo" />
	

	<!--- Note: use returnFormat="plain" when serving cross domains with jsonp --->
    <cffunction name="getCompanies" access="remote" returntype="any" httpmethod="GET" returnformat="json"> 
		<cfset var qry_getCompanies = "" />
		<cfquery name="qry_getCompanies" datasource="#variables.dsn#">
			SELECT `companies`.`idcompanies`,
			    `companies`.`name`,
			    `companies`.`address1`,
			    `companies`.`address2`,
			    `companies`.`city`,
			    `companies`.`state`,
			    `companies`.`zip`,
				`companies`.`phone`,
			    `companies`.`website`
			FROM `contactsdemo`.`companies`
			ORDER BY `companies`.idcompanies ASC;
		</cfquery>
		
		<!--- Handle jsonp resquest --->
		<cfif structKeyExists(arguments, "callback")>
			<cfreturn arguments.callback & "(" & serializeJSON(qry2json(querySet=qry_getCompanies,lcase=true)) & ")">
		<cfelse><!--- else json response --->
			<cfreturn qry2json(querySet=qry_getCompanies,lcase=true)>
		</cfif>
    </cffunction> 
	
	<!--- Note: use returnFormat="plain" when serving cross domains with jsonp --->
	<cffunction name="getContactsById" access="remote" returntype="any" httpmethod="GET" returnformat="json"> 
		<cfargument name="contactId" type="numeric" default="0" required="yes">
		<cfset var qry_getContacts = "" />
		<cfquery name="qry_getContacts" datasource="#variables.dsn#">
			SELECT 
				c.idcontacts,
			    c.idcompanies,
			    c.firstname,
			    c.lastname,
			    c.image,
			    c.dateCreated,
			    c.lastmodifed,
				e.email,
				e.isprimary as primaryEmail,
				a.address1,
				a.address2,
				a.city,
				a.state,
				a.zip,
				a.isprimary as PrimaryAddress,
				p.phone,
				p.isPrimary as primaryPhone
			FROM contactsdemo.contacts c
			INNER JOIN contactsdemo.email e ON c.idcontacts =e.idcontacts 
			INNER JOIN contactsdemo.addresses a ON c.idcontacts =a.idcontacts
			INNER JOIN contactsdemo.phonenumbers p ON c.idcontacts =p.idcontacts
			WHERE c.idcontacts = <cfqueryparam value="#arguments.contactId#" cfsqltype="CF_SQL_INTEGER">;
		</cfquery>
		
		<!--- Handle jsonp resquest --->
		<cfif structKeyExists(arguments, "callback")>
			<cfreturn arguments.callback & "(" & serializeJSON(qry2json(querySet=qry_getContacts,lcase=true)) & ")">
		<cfelse><!--- else json response --->
			<cfreturn qry2json(querySet=qry_getContacts,lcase=true)>
			
		</cfif>
    </cffunction> 
		
	
	<!--- Note: use returnFormat="plain" when serving cross domains with jsonp --->
	<cffunction name="getContactsViewByCompanyId" access="remote" returntype="any" httpmethod="GET" returnformat="json"> 
		<cfargument name="companyId" type="numeric" default="0" required="yes">
		<cfset var qry_getContactsViewByCompanyId = "" />
		<cfquery name="qry_getContactsViewByCompanyId" datasource="#variables.dsn#">
			SELECT 
				c.idcontacts,
				c.firstname,
				c.lastname,
				c.image,
				e.email,
				p.phone
			FROM contactsdemo.phonenumbers AS p
			INNER JOIN contactsdemo.contacts c ON p.idcontacts = c.idcontacts
			INNER JOIN contactsdemo.companies co ON  co.idcompanies = c.idcompanies
			INNER JOIN contactsdemo.email e ON c.idcontacts = e.idcontacts
			WHERE co.idcompanies = <cfqueryparam value="#arguments.companyId#" cfsqltype="CF_SQL_INTEGER">;
		</cfquery>
		
		<!--- Handle jsonp resquest --->
		<cfif structKeyExists(arguments, "callback")>
			<cfreturn arguments.callback & "(" & serializeJSON(qry2json(querySet=qry_getContactsViewByCompanyId,lcase=true)) & ")">
		<cfelse><!--- else json response --->
			<cfreturn qry2json(querySet=qry_getContactsViewByCompanyId,lcase=true)>
		</cfif>
    </cffunction> 
	
	
	<!--- Convert Coldfusion/Lucee Column-based json to Row-based json --->
    <cffunction name="qry2json" access="private" returntype="any" output="Yes">
        <cfargument name="querySet" type="query" required="yes">
        <cfargument name="convertLineBreaksForJSON" default="false" required="no">
		<cfargument name="escSpecChar" default="false" required="no">
        <cfargument name="startRow" required="no" default="1">
        <cfargument name="endRow" required="yes" default="#arguments.querySet.recordCount#">
		<cfargument name="lcase" type="boolean" default="false">
		<cfargument name="additionalAttributes" type="struct">
        <cfargument name="addArrayIdx" default="false">
            
        
        <cfset returnedRecordCount = (arguments.endRow-arguments.startRow)+1>
        <cfset  result = structNew()>
		
		<!--- if the querySet is not empty --->
        <cfif querySet.recordCount GT 0>
		<!--- Create an "ROWS" Array to hold the row objects --->
		<cfset ROWS = arrayNew(1)>
				<!---loop through each row in the record set--->
                <cfloop query="querySet" startrow="#arguments.startRow#" endrow="#arguments.endRow#">
					<!--- create an object for each row --->
					<cfset jsonObjItem = structNew()>
					<!--- loop for each column in the datasset --->
                    <cfloop index="columnName" list="#querySet.columnList#" delimiters=",">
						<cfset var thisValueItem = evaluate("querySet."&columnName)>
						<cfif arguments.escSpecChar>
							<cfset thisValueItem = cleanStringForJSON(thisValueItem)>
						</cfif>
						
						<!--- Handle Line Breaks in the value item --->
						<cfif convertLineBreaksForJSON EQ false>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItem,"#chr(13)##chr(10)#","<br>","all")>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItemLB,chr(13),"<br>","all")>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItemLB,chr(10),"<br>","all")>        
			            <cfelse>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItem,"#chr(13)##chr(10)#","\n\r","all")>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItemLB,chr(13),"\n","all")>
			                <cfset thisValueItemLB = replaceNoCase(thisValueItemLB,chr(10),"\r","all")>
			            </cfif>
						
						<!---populate the object with a name:value pair for each column --->
						<cfif arguments.lcase EQ true>
							<cfset jsonObjItem["#lcase(columnName)#"] = thisValueItemLB>
						<cfelse>
							<cfset jsonObjItem["#columnName#"] = thisValueItemLB>
						</cfif>
                            
                        <cfif arguments.addArrayIdx EQ true>
                            <cfset jsonObjItem["arrayIdx"] = querySet.currentRow-1>
                        </cfif>    
						
						<!--- add the object to the ROWS array --->
						<cfset ROWS[querySet.currentRow] = jsonObjItem>
                    </cfloop>  
            	</cfloop>
				
			<cfset result.ROWS = ROWS>
			<cfset result.DATASET = INT(variables.returnedRecordCount)>
			<cfset result.RECORDSET = querySet.recordCount> 
			<cfset result["success"] = true>
			<!--- loop over the additionalAttributes and add them to the JSON packet. --->
			<cfif isDefined("additionalAttributes")>
				<cfloop collection="#additionalAttributes#" item="attrItem">
					<cfset result["#attrItem#"] = Evaluate("additionalAttributes.#attrItem#")>
				</cfloop>
			</cfif>
			
			
        <cfelse>
			<cfset result.ROWS = arrayNew(1)>
			<cfset result.DATASET = 0> 
			<cfset result.RECORDSET = querySet.recordCount> 
			<cfset result["success"] = false>
			<cfset result["msg"] = "No records found">
        </cfif>
            
       <cfreturn result>
    </cffunction>
	
</cfcomponent>