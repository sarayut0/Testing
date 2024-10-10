*** Settings ***
Resource    import.resource
Variables    data2.yaml

*** Test Cases ***
Run homework
    Open Browser     ${url}   ${browser}
    Login
        Varify text
        Click add to cart
        Click shopping cart
        Varify text2    ${Verify}    ${timeout}
        Click Checkout
        Input Information    ${information.work.first_name}    ${information.work.last_name}    ${information.work.postal}
        
        Click Continue
        Varify text3
        Click Finish
        Varify text4
    #${CSV_FILE}    Set Variable    Test_robot_csv.csv
    #${DATA_CSV}     Read Csv File To Associative   ${CSV_FILE}
    #Log To Console    ${DATA_CSV[1]}[\ï»¿username]
    #Log To Console    ${DATA_CSV}
    #FOR    ${row}    IN    @{DATA_CSV}    
        #Run    #${row}
        
    #END

*** Keywords ***

Click add to cart
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button
Click shopping cart
    Click Element    //*[@id="shopping_cart_container"]

Click Checkout
    Click Element    //*[@id="cart_contents_container"]/div/div[2]/a[2]
Click Continue
    Click Button    //*[@id="checkout_info_container"]/div/form/div[2]/input

Click Finish
    Click Element    //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
Varify text
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=20s  

Varify text2
    [Arguments]    ${Verify}    ${timeout}
    Wait Until Element Is Visible    //*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/div[2]/div    timeout=20s

Varify text3
    Wait Until Element Is Visible    //*[@id="checkout_summary_container"]/div/div[2]/div[7]   timeout=20s

Varify text4
    Wait Until Element Is Visible    //*[@id="checkout_complete_container"]/h2   timeout=20s