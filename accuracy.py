from openpyxl import Workbook
    









class accuracy():
    def bid_results(self):
        """
        This function will allow the user to
        automatically inster the copied text from planet bids
        and automatically store it within an excel file.
        This is while we allocate some time to do the web scraping.
        """
        bidders = []
        with open(self,"r") as file:
            lines = file.readlines()

        for bidder_info in range(0, len(lines), 5):
            bidders.append(lines[bidder_info:bidder_info+5])
        
        return bidders #make sure this works


def allocating_to_excel(self):
    wb = Workbook(self)



    ws = wb.active











if __name__ == "__main__":
    accuracy.bid_results("/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBidResults.txt")
    accuracy.allocating_to_excel("/Users/damiamalfaro/Desktop/Accuracy/Estimate/DataBase/OliveGrovePark/OliveGroveBidResults.xlsx")






