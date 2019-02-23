<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="xml" indent="yes"/>
   <xsl:template match="/">
      <aev:adverseEvents xmlns:aev="http://eudract.ema.europa.eu/schema/clinical_trial_result/adverse_events" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <description>AE additional description</description>
      <nonSeriousEventFrequencyThreshold>1</nonSeriousEventFrequencyThreshold>
      <timeFrame>Timeframe for AE</timeFrame>
      <assessmentMethod>
         <value>ADV_EVT_ASSESS_TYPE.non_systematic</value>
      </assessmentMethod>
      <dictionary>
         <otherName xsi:nil="true"/>
         <version>19.0</version>
         <name>
            <value>ADV_EVT_DICTIONARY_NAME.meddra</value>
         </name>
      </dictionary>
      <xsl:apply-templates select="safety_data/df_group"/>
      <xsl:apply-templates select="safety_data/non_serious_freq_table"/>
      <xsl:apply-templates select="safety_data/serious_freq_table"/>

   </aev:adverseEvents>
   </xsl:template>
   

   <xsl:template match="safety_data/df_group">
   <reportingGroups>
   <xsl:apply-templates select="./row"/>

   </reportingGroups>
   </xsl:template>
   <xsl:template match="safety_data/df_group/row">
   <xsl:param name="groupTitle" select="./title/text()"/>
   <reportingGroup id="ReportingGroup-{$groupTitle}">
   <title>
   <xsl:value-of select="./title/text()"/>
   </title>
   <description>
   <xsl:value-of select="./description/text()"/>
   </description>
   <subjectsAffectedByNonSeriousAdverseEvents>
   <xsl:value-of select="./subjectsAffectedByNonSeriousAdverseEvents/text()"/>
   </subjectsAffectedByNonSeriousAdverseEvents>
   
   <subjectsAffectedBySeriousAdverseEvents>
   <xsl:value-of select="./subjectsAffectedBySeriousAdverseEvents/text()"/>
   </subjectsAffectedBySeriousAdverseEvents>

   <subjectsExposed>
   <xsl:value-of select="./subjectsExposed/text()"/>
   </subjectsExposed>

   <deathsAllCauses>
   <xsl:value-of select="./deathsAllCauses/text()"/>
   </deathsAllCauses>

   <deathsResultingFromAdverseEvents>
   <xsl:value-of select="./deathsResultingFromAdverseEvents/text()"/>
   </deathsResultingFromAdverseEvents>

   </reportingGroup>
   </xsl:template>

   <xsl:template match="safety_data/non_serious_freq_table">
   <nonSeriousAdverseEvents>   
   <xsl:apply-templates select="./row"/>
   </nonSeriousAdverseEvents>
   </xsl:template>

   <xsl:template match="safety_data/serious_freq_table">
   <seriousAdverseEvents>   
   <xsl:apply-templates select="./row"/>
   </seriousAdverseEvents>
   </xsl:template>

   <xsl:template match="safety_data/non_serious_freq_table/row">
   <xsl:param name="termName" select="./term/text()"/>
   <xsl:param name="eutctId" select="./eutctId/text()"/>
   <xsl:if test="/safety_data/df_group/row[1]/title/text() = ./group/text()"> 


   <nonSeriousAdverseEvent>
   <description>
   <xsl:value-of select="./description/text()"/>
   </description>
   <term>
   <xsl:value-of select="./term/text()"/>
   </term>
   <organSystem>
   <eutctId><xsl:value-of select="./eutctId/text()"/></eutctId>
   <version>19</version>
   </organSystem>
   <assessmentMethod>
   <value>
   ADV_EVT_ASSESS_TYPE.non_systematic
   </value>
   </assessmentMethod>
   <dictionaryOverridden>
   false
   </dictionaryOverridden>

   <values>
   <xsl:for-each select="../*">
   <xsl:if test="$termName = ./term/text()">
      <xsl:if test="$eutctId = ./eutctId/text()">
         <xsl:variable name="tmpGroupName" select="./group/text()"/>
         <xsl:value-of select="./title/text()"/>
        <value reportingGroupId="ReportingGroup-{$tmpGroupName}">
          <occurrences><xsl:value-of select="./occurrences/text()"/></occurrences>
          <subjectsAffected><xsl:value-of select="./subjectsAffected/text()"/></subjectsAffected>
          <subjectsExposed><xsl:value-of select="./subjectsExposed/text()"/></subjectsExposed>
        </value>




      </xsl:if>
   </xsl:if>
   </xsl:for-each>
   </values>



   </nonSeriousAdverseEvent>
   </xsl:if>

   </xsl:template>




   <xsl:template match="safety_data/serious_freq_table/row">
   <xsl:param name="termName" select="./term/text()"/>
   <xsl:param name="eutctId" select="./eutctId/text()"/>
   <xsl:if test="/safety_data/df_group/row[1]/title/text() = ./group/text()"> 


   <seriousAdverseEvent>
   <description>
   <xsl:value-of select="./description/text()"/>
   </description>
   <term>
   <xsl:value-of select="./term/text()"/>
   </term>
   <organSystem>
   <eutctId><xsl:value-of select="./eutctId/text()"/></eutctId>
   <version>19</version>
   </organSystem>
   <assessmentMethod>
   <value>
   ADV_EVT_ASSESS_TYPE.non_systematic
   </value>
   </assessmentMethod>
   <dictionaryOverridden>
   false
   </dictionaryOverridden>

   <values>
   <xsl:for-each select="../*">
   <xsl:if test="$termName = ./term/text()">
      <xsl:if test="$eutctId = ./eutctId/text()">
         <xsl:variable name="tmpGroupName" select="./group/text()"/>
         <xsl:value-of select="./title/text()"/>
        <value reportingGroupId="ReportingGroup-{$tmpGroupName}">
          <occurrences><xsl:value-of select="./occurrences/text()"/></occurrences>
          <subjectsAffected><xsl:value-of select="./subjectsAffected/text()"/></subjectsAffected>
          <subjectsExposed><xsl:value-of select="./subjectsExposed/text()"/></subjectsExposed>
          <occurrencesCausallyRelatedToTreatment><xsl:value-of select="./occurrencesCausallyRelatedToTreatment/text()"/></occurrencesCausallyRelatedToTreatment>
          <fatalities>
            <deaths><xsl:value-of select="./deaths/text()"/></deaths>
            <deathsCausallyRelatedToTreatment><xsl:value-of select="./deathsCausallyRelatedToTreatment/text()"/></deathsCausallyRelatedToTreatment>
          </fatalities>
        </value>
      </xsl:if>
   </xsl:if>
   </xsl:for-each>
   </values>
   </seriousAdverseEvent>
   </xsl:if>
   </xsl:template>

</xsl:stylesheet>