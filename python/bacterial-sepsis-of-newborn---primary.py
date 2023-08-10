# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"Q40A100","system":"readv2"},{"code":"Q40A200","system":"readv2"},{"code":"Q40y100","system":"readv2"},{"code":"110079.0","system":"med"},{"code":"13303.0","system":"med"},{"code":"22031.0","system":"med"},{"code":"3613.0","system":"med"},{"code":"39324.0","system":"med"},{"code":"39691.0","system":"med"},{"code":"47693.0","system":"med"},{"code":"54637.0","system":"med"},{"code":"55606.0","system":"med"},{"code":"56336.0","system":"med"},{"code":"60617.0","system":"med"},{"code":"6097.0","system":"med"},{"code":"66780.0","system":"med"},{"code":"67438.0","system":"med"},{"code":"68665.0","system":"med"},{"code":"93976.0","system":"med"},{"code":"96710.0","system":"med"},{"code":"96711.0","system":"med"},{"code":"98366.0","system":"med"},{"code":"98669.0","system":"med"},{"code":"99123.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('bacterial-sepsis-of-newborn-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["bacterial-sepsis-of-newborn---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["bacterial-sepsis-of-newborn---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["bacterial-sepsis-of-newborn---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
