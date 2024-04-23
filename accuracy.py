from openpyxl import Workbook
import pandas as pd 


class PlanetBids():

    # Function 1.1
    def BidResults(self):
        bidders_raw = []
        with open(self,"r") as file:
            lines = file.readlines()

        for bidder_info in range(0, len(lines), 5):
            bidders_raw.append(lines[bidder_info:bidder_info+5])
        
        return bidders_raw


    # Function 1.2
    def Stratification(self):
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

    
    # Function 1.3 Climax
    def ExcelAllocation(self,bidders):
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


    
    #  Function 2.1
    def BidderSubs(self):
        with open(self,"r") as file:
            read = file.read()

        bidders_subs = read.split("\n\n\n")
        return bidders_subs


    

    # Function 2.2
    def SubsAllocation(self,bidders):
        """
        This function allocates the clean subcontractor information
        into an excel file for visualization.
        """
        bidders_subs = []
        for bidder_num, copied in enumerate(self):
            print(f"Bidder #{bidder_num+1}: {bidders[bidder_num]['name']}")
            breakdown = copied.split("Zip")
            for i in breakdown:
                print(i)
                print("-----------------------------------------")
                print("-----------------------------------------")
                print("-----------------------------------------")
            print("-----------------------------------------")
            print("-----------------------------------------")
            print("-----------------------------------------")
            print("-----------------------------------------")
            print("-----------------------------------------")
            print("-----------------------------------------")


    def bidder_line_items(self):
        """
        This function cleans and allocates line
        items data into an excel file.
        """
        pass





if __name__ == "__main__":
    # Insert corresponding file
    bid_results_raw_text = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBidResults.txt" 

    # Insert corresponding file
    bid_results_spreadsheet = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBidResults.xlsx"

    # Insert corresponding file
    bidders_subcontractors = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBiddersSubs.txt"

    # Insert corresponding file
    bidders_line_items = "/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBiddersLineItems.txt"
    
    """
    Planet Bids
    """
    # Function 1.2 will be used multiple times, thereby its own variable.
    Bidders = PlanetBids.Stratification(PlanetBids.BidResults(bid_results_raw_text))

    # Function 1 Allocates bidder summary results in Excel
    PlanetBids.ExcelAllocation(bid_results_spreadsheet, Bidders)

    # Function 2 Allocates bidder's subcontractors information in Excel below each bidder information.
    PlanetBids.SubsAllocation(PlanetBids.BidderSubs(bidders_subcontractors),Bidders)














