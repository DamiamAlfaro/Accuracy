from openpyxl import Workbook
import pandas as pd 







class accuracy():
    def bid_results(self):
        """
        This function will allow the user to
        automatically inster the copied text from planet bids
        in order to stratify it.
        """
        bidders_raw = []
        with open(self,"r") as file:
            lines = file.readlines()

        for bidder_info in range(0, len(lines), 5):
            bidders_raw.append(lines[bidder_info:bidder_info+5])
        
        return bidders_raw
    
    def stratification(self):
        bidders = []
        for bidder_id in self:
            bidder = {}
            bidder["name"] = bidder_id[0][:-1]
            bidder["address"] = bidder_id[1][:-1]+", "+bidder_id[2][:-1]
            bidder["contact"] = bidder_id[3][:-1]
            strata = bidder_id[4].split("\t")[:-1]
            bidder["phone"] = strata[0]
            bidder["types"] = strata[1]
            bidder["amount"] = strata[2]
            bidders.append(bidder)
        
        return bidders

    


    def excel_allocation(self,bidders):
        with pd.ExcelWriter(self, engine="openpyxl") as writer:
            for index, dictionary in enumerate(bidders):
                df = pd.DataFrame(list(dictionary.items()), columns=["Key","Value"])
                sheet_name = dictionary.get("Name",f"Sheet_{index+1}")
                df.to_excel(writer, sheet_name=f"Sheet_{index+1}", index=False)












if __name__ == "__main__":
    bid_results_raw_text = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBidResults.txt"
    bid_results_spreadsheet = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBidResults.xlsx"
    accuracy.excel_allocation(bid_results_spreadsheet, accuracy.stratification(accuracy.bid_results(bid_results_raw_text)))






