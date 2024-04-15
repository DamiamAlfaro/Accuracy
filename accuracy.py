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
        """
        This functions prepares each attribute of the
        bidder in order to place it within an 
        excel file for a better visualization.
        """
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
        """
        This function allocates the "clean" data points
        from the function above into an excel file."
        """
        with pd.ExcelWriter(self, engine="openpyxl") as writer:
            df_all = pd.DataFrame(bidders)
            df_all.to_excel(writer, index=False, sheet_name="BidResults")
            for i, bidder in enumerate(bidders,start=1):
                df_individual = pd.DataFrame([bidder])
                df_individual.to_excel(writer,index=False,sheet_name=f"Bidder{i}")


    def bidder_subcontractors(self):
        """
        This function reads and stratifies subcontracor's
        information from each bidder.
        """
        with open(self,"r") as file:
            read = file.read()

        bidders_subs = read.split("\n\n\n")
        return bidders_subs

    def subs_allocation(self):
        """
        This function allocates the clean subcontractor information
        into an excel file for visualization.
        """
        for i, y in enumerate(self):
            print(f"Bidder #{i+1}:")
            print(y)
            #print("-----------------------------------------")

    def bidder_line_items(self):
        """
        This function cleans and allocates line
        items data into an excel file.
        """
        pass





if __name__ == "__main__":
    bid_results_raw_text = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBidResults.txt" #insert corresponding file
    bid_results_spreadsheet = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBidResults.xlsx" #insert corresponding text file
    bidders_subcontractors = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBiddersSubs.txt" #insert corresponding text file
    bidders_line_items = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBiddersLineItems.txt" #insert corresponding text file
    accuracy.excel_allocation(bid_results_spreadsheet, accuracy.stratification(accuracy.bid_results(bid_results_raw_text)))
    accuracy.subs_allocation(accuracy.bidder_subcontractors(bidders_subcontractors))






































































