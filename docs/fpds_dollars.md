Here are the broad spending categories covered by the [data dictionary.](/dictionary/FPDS_DataDictionary_V15_OT.pdf)

3 Dollar Values
* 3A Base and All Options Value (Total Contract Value)
* 3B Base And Exercised Options Value
* 3C Action Obligation
* 3E Total Estimated Order Value
3T Total Dollar Values
* 3AT Total Base and All Options Value
* 3BT Total Base and Exercised Options Value
* 3CT Total Dollars Obligated


*_Action Obligation_ / _Total Dollars Obligated_*
This is money that is going or has gone out the door. Action obligation is for the transaction, Total Dollars Obligated for the entire contract.

*_Base And Exercised Options Value_ / _Total Base and Exercised Options Value_*
This is the ceiling of the base contract, plus any options exercised to this point. Base And Exercised Options Value is for the given transaction, so it will have value for the original entry and anytime an option is exercised or there’s a change order or the like. Total Base and Exercised Options Value covers all the base and all options that have been exercised for the entire contract.

*_Base and All Options Value_ / _Total Base and All Options Value_*
This is the ceiling of the entire contract. It could change via a change order or the like. In a contract without options it will be the same as the corresponding Base and Exercised Options Value.  Base and All Options Value will typically be covered in the first transaction for a contract and then only updated if there’s a change order or the like. Total Base and All Options Value covers the entire contract, whether or not the options have been exercised yet.

Taking a random missile contract example from [USAspending.gov](https://www.usaspending.gov/award/CONT_AWD_W31P4Q19C0101_9700_-NONE-_-NONE-0)
![Spending Bar](USAspending_spend_bar.png)
![Spending Line](USAspending_spend_line.png)
 
Outlayed amount is new! I was surprised to see it and we’ll see if they start including it in my data. I don’t trust it in its present form because. Finding another example apparently only $29 million has been outlayed on [the main JSF contract](https://www.usaspending.gov/award/CONT_AWD_N0001902C3002_9700_-NONE-_-NONE-) and there’s no way that’s true in the intuitive sense of outlay.
* 818 million -Obligated amount = Total Dollars Obligated
* 818 million - Current Award Amount = Total Base and Exercised Options Value
* 1.0 Billion - Potential Award Amount = Total Base and All Options Value

So in this case funds have been obligated for the entire amount base and exercised amount. Looks like options may have been exercised about once a fiscal year and then have been steady for a couple years. 
