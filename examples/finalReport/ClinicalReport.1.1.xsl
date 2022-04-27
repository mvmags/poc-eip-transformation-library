
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>
	<!--   Copy everything   -->
	<xsl:template match="@*|node()|text()|comment()|processing-instruction()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()|text()|comment()|processing-instruction()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="FinalReport">
		<xsl:copy>
			<xsl:attribute name="xsi:noNamespaceSchemaLocation">
				<xsl:value-of select="'http://integration.foundationmedicine.com/reporting/ClinicalReport.1.1.xsd'"/>
			</xsl:attribute>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
   </xsl:template>
   
	<!--   Remove SaveCommand   -->
	<xsl:template match="SaveCommand"/>
	<!--   Remove DeleteCommand   -->
	<xsl:template match="DeleteCommand"/>
	<!--   Remove FinalReport/KeyFields   -->
	<xsl:template match="KeyFields"/>
	<!--   Remove CommandParams   -->
	<xsl:template match="CommandParams"/>
	<!--   Remove isDirty attribute   -->
	<xsl:template match="@isDirty"/>
	<!--   Remove isDeleted attribute   -->
	<xsl:template match="@isDeleted"/>
	<!--   Remove typeName attribute   -->
	<xsl:template match="@typeName"/>
	<!--   Remove sqlCommandTimeout attribute   -->
	<xsl:template match="@sqlCommandTimeout"/>
	<!--   Remove targetDatabase attribute   -->
	<xsl:template match="@targetDatabase"/>
	<!-- Remove noNamespaceSchemaLocation-->
	<xsl:template match="@xsi:noNamespaceSchemaLocation"/>
	<!--   Remove InsertedBy   -->
	<xsl:template match="InsertedBy"/>
	<!--   Remove ModifiedBy   -->
	<xsl:template match="ModifiedBy"/>
    <xsl:template match="ModifedBy"/>
	<xsl:template match="ApplicationId"/>
	<xsl:template match="ApplicationTypeId"/>
	<xsl:template match="Application/Name"/>
	<xsl:template match="Description"/>
	<xsl:template match="ApplicationType"/>
	<xsl:template match="InsertedDts"/>
	<xsl:template match="ApplicationSettingId"/>
	<xsl:template match="FinalReport/Application/ApplicationSettings/ApplicationSetting[not(contains(Name,'Statement'))]"/>
	<xsl:template match="IsAutoCount"/>
	<xsl:template match="ReportStatus"/>
	<xsl:template match="ImageURL"/>
	<xsl:template match="NoveltyScore"/>
	<xsl:template match="CollMethod"/>
	<xsl:template match="TumorSite"/>
	<xsl:template match="Stage"/>
	<xsl:template match="RequestedDate"/>
	<xsl:template match="Routing"/>
	<xsl:template match="TherapyImplications"/>
	<xsl:template match="FDANonApprovedSummary"/>
	<xsl:template match="OriginalName"/>
	<xsl:template match="GeneShortDescriptionRtf"/>
	<xsl:template match="GeneLongDescriptionRtf"/>
	<xsl:template match="AboutTheAlterationRtf"/>
	<xsl:template match="RelavanceRtf"/>
	<xsl:template match="InterpretationRtf"/>
	<xsl:template match="ClinicalTrialNoteRtf"/>
	<xsl:template match="RationaleRtf"/>
	<xsl:template match="GeneOriginalName"/>
	<xsl:template match="AlterationOriginalName"/>
	<xsl:template match="TitleRtf"/>
	<xsl:template match="SummaryRtf"/>
	<xsl:template match="ConditionRtf"/>
	<xsl:template match="TargetRtf"/>
	<xsl:template match="EligibilityRtf"/>
	<xsl:template match="NoteRtf"/>
	<xsl:template match="ShortDescriptionRtf"/>
	<xsl:template match="FinalReport/PMI/CopiedPhysician2"/>
	<xsl:template match="GeneShortDescription"/>
	<xsl:template match="GeneLongDescription"/>
	<xsl:template match="GeneShortDescriptionRtf"/>
	<xsl:template match="GeneLongDescriptionRtf"/>
	<xsl:template match="ShortDescription"/>
	<xsl:template match="AboutTheAlteration"/>
	<xsl:template match="ShortDescriptionRtf"/>
	<xsl:template match="AboutTheAlterationRtf"/>
	<xsl:template match="RelevanceRtf"/>
	<xsl:template match="RelavanceRtf"/>
	<xsl:template match="TitleRtf"/>
	<xsl:template match="SummaryRtf"/>
    <xsl:template match="ConditionRtf"/>
    <xsl:template match="TargetRtf"/>
    <xsl:template match="EligibilityRtf"/>
    <xsl:template match="NoteRtf"/>
	<xsl:template match="NCCNCompendiaStatus"/>
	<xsl:template match="DevelopmentStage"/>
	<xsl:template match="FullCitationRtf"/>
	<xsl:template match="ClinicalTrialSummary"/>
	<xsl:template match="FinalReport/KbExportDate"/>
	<xsl:template match="FinalReport/IsPharmaCLIA"/>
	<xsl:template match="FinalReport/Study"/>
	<xsl:template match="IsInterpretationReviewed"/>
	<xsl:template match="IsClinicalTrialNoteReviewed"/>
	<xsl:template match="InterpretationReviewedOnDate"/>
	<xsl:template match="ClinicalTrialNoteReviewedOnDate"/>
	<xsl:template match="IsRationaleReviewed"/>
	<xsl:template match="RationaleReviewedOnDate"/>
	<xsl:template match="CancerRelatedAlterations"/>
	<xsl:template match="EnrollmentCriteria"/>
	<xsl:template match="CopiedPhysician2"/>
	<xsl:template match="FinalReport/Sample/BaitSet"/>
	<xsl:template match="FinalReport/AAC/ModifiedDts"/>
	<xsl:template match="FinalReport/QualityStatus"/>
	<xsl:template match="Trial/@source"/>
    <xsl:template match="ReceivedDate">
        <xsl:choose>
            <xsl:when test="contains(., 'T')">
                <ReceivedDate>
                    <xsl:value-of select="substring-before(., 'T')"/>
                </ReceivedDate>
            </xsl:when>
            <xsl:otherwise>
                <ReceivedDate>
                    <xsl:value-of select="."/>
                </ReceivedDate>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="DOB">
        <xsl:choose>
            <xsl:when test="contains(., 'T')">
                <DOB>
                    <xsl:value-of select="substring-before(., 'T')"/>
                </DOB>
            </xsl:when>
            <xsl:otherwise>
                <DOB>
                    <xsl:value-of select="."/>
                </DOB>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="CollDate">
        <xsl:choose>
            <xsl:when test="contains(., 'T')">
                <CollDate>
                    <xsl:value-of select="substring-before(., 'T')"/>
                </CollDate>
            </xsl:when>
            <xsl:otherwise>
                <CollDate>
                    <xsl:value-of select="."/>
                </CollDate>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
