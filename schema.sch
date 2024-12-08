<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <title>Banksy Project Location Geocoding Validation</title>
    
    <pattern id="location-geocode-validation">
        <title>Geocoding Rules for Location Elements</title>
        
<!--Australia-->
        <rule context="location[contains(text(), 'AU')]">
            <assert test="@long &gt; 100">The longitude for locations in Australia (AU) must be greater than 100 to place it east of the Prime Meridian.</assert>
            <assert test="@lat &lt; 0">The latitude for locations in Australia (AU) must be less than zero to place it in the Southern Hemisphere.</assert>
            <assert test="@long &gt; 0">The longitude value for AU locations must be positive.</assert>
        </rule>
        
<!--United States-->
        <rule context="location[contains(text(), 'USA')]">
            <assert test="@long &lt; 0">The longitude for locations in the USA must be less than zero to place it west of the Prime Meridian.</assert>
            <assert test="@lat &gt; 0">The latitude for locations in the USA must be greater than zero to place it in the Northern Hemisphere.</assert>
        </rule>
    
    </pattern>
</schema>