<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <sch:title>Validation for Transcript XML</sch:title>

    <sch:pattern>
        <sch:rule context="Transcript_Sent_Recieved">
            <sch:assert test="@TSR and string-length(@TSR) > 0">TSR attribute is missing or
                empty</sch:assert>
        </sch:rule>

        <sch:rule context="Sender">
            <sch:assert test="string-length(@N | @V) > 0">Sender element is missing a required N or
                V attribute</sch:assert>
        </sch:rule>
        <sch:rule context="Reciever">
            <sch:assert test="string-length(@N | @V) > 0">Reciever element is missing a required N
                or V attribute</sch:assert>
        </sch:rule>

        <sch:rule context="Message">
            <sch:assert test="string-length(text()) > 0">Message element is empty</sch:assert>
        </sch:rule>

        <sch:rule context="Next_Day/DATE">
            <sch:assert test="matches(@D, '^\d{1,2} \w+ \d{4}$')">Invalid date format. Expected
                format: 'Day Month Year'</sch:assert>
        </sch:rule>

        <sch:rule context="Narrator_Information">
            <sch:assert test="string-length(text()) > 0">Narrator_Information element is
                empty</sch:assert>
        </sch:rule>

        <sch:rule context="Transcript_Sent_Recieved">
            <sch:assert test="Sender and Reciever and Message">Transcript_Sent_Recieved is missing
                Sender, Reciever, or Message</sch:assert>
        </sch:rule>

        <sch:rule context="Transcript_Sent_Recieved">
            <sch:assert test="matches(@TSR, '^\d+$')">TSR attribute should be a number</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
