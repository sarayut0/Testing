*** Settings ***
Library    OperatingSystem
Library    Collections
Library    String
Library    CSVLibrary
Library    Telnet
Library    SeleniumLibrary
Variables    data2.yaml



*** Keywords ***
Login
    Input USERNAME        ${name.standard.user}
    Input Password        ${name.standard.password}
    Click

Open Browser edge
    [Arguments]    ${url}       ${browser}
    Open Browser       ${url}    ${browser}

Input USERNAME
    [Arguments]      ${username}
    Input Text    //*[@id="user-name"]     ${username}

Input Password
    [Arguments]      ${password}
    Input Text    //*[@id="password"]     ${password}
Input Information
    [Arguments]        ${first_name}    ${last_name}   ${postal}
    Input Text     //*[@id="first-name"]     ${first_name}
    Input Text       //*[@id="last-name"]    ${last_name}
    Input Text     //*[@id="postal-code"]    ${postal}

Click
    Click Button    //*[@id="login-button"]
