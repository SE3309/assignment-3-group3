# code to generate data

from collections.abc import Callable
from typing import cast
from faker import Faker
from functools import partial
import random
from csv import DictReader

# load directly into sql db insead

faker = Faker()

# create table, then populate
def create_table(file_name: str, num_tuples: int,
                 attr: list[str], pk: list[str], fk: dict[str, str], faker_alias: list[str],
                 header: bool = True, exclude: dict[str, str] = {}):

    faker_commands: list[Callable[[], str]] = []

    # header that defines values
    if(header):
        with open(file_name+".csv", "w") as f:
             _ = f.write(init_table(attr, faker_alias, faker_commands)+"\n")

    fk_columns = get_fk_values(fk, exclude)

    # keep track of pk and ak
    key_columns: list[set[str]] = []
    for i in pk:
        key_columns.append(set())

    # entries
    with open(file_name+".csv", "a") as f:
        for i in range(num_tuples):
            _ = f.write(gen_entry(attr, faker_commands, fk_columns, key_columns)+"\n")


# populate header
def init_table(attr: list[str], faker_alias: list[str], faker_commands: list[Callable[[], str]]) -> str:
    header=""
    default = partial(faker.pystr, max_chars=10)

    for i in range(len(attr)):
        header+=attr[i]+","
        command = getattr(faker, faker_alias[i], default)
        faker_commands.append(cast(Callable[[], str], command))

    return header[:-1]

# populate entry
def gen_entry(attr: list[str], faker_commands: list[Callable[[], str]], fk_columns: dict[str, list[str]], key_columns: list[set[str]]) -> str:
    entry:str=""
    
    i = 0
    while i < len(faker_commands):
        # get val from existing fk val
        if attr[i] in fk_columns:
            command = fk_columns[attr[i]][random.randrange(1, len(fk_columns[attr[i]]))]
        # else generate val via faker
        else:
            command = faker_commands[i]()

        # if val already exists, redo
        if i < len(key_columns) and command in key_columns[i]:
            continue

        entry += command+","

        if i < len(key_columns):
            key_columns[i].add(command)

        i+=1

    return entry[:-1]

# get fk values
def get_fk_values(fk: dict[str, str], exclude: dict[str, str]) -> dict[str, list[str]]:
    fk_columns: dict[str, list[str]] = {}
    for i in fk:
        exclusion_list: list[str] = []

        # exclusion list
        if i in exclude:
            with open(exclude[i]+".csv", "r") as f:
                reader = DictReader(f)
                
                for row in reader:
                    exclusion_list.append(row[i])

        with open(fk[i]+".csv", "r") as f:
            reader = DictReader(f)
            
            fk_columns[i] = []
            for row in reader:
                if row[i] not in exclusion_list:
                    fk_columns[i].append(row[i])

    return fk_columns

# TODO: have the faker_alias list just be callable functions

# tables
create_table("Employee", 2000, 
             ["employee_id", "email", "f_name", "l_name", "birthday", "hours_worked", "salary"],      # attributes
             ["employee_id", "email"],                                                             # keys (pk + ak)
             {},                                                                                  # foreign keys
             ["msisdn", "email", "first_name", "last_name", "date", "building_number", "msisdn"]) # faker alias
create_table("SalesAssociate", 1000,
             ["employee_id", "commission_rate"],
             ["employee_id"],
             {"employee_id": "Employee"}, 
             ["(fk)", "day_of_month"])
create_table("Manager", 100,
             ["employee_id", "bonus_rate"],
             ["employee_id"],
             {"employee_id": "Employee"},
             ["(fk)", ""],
             exclude = {"employee_id": "SalesAssociate"})
# # Store  (FK -> Manager.employee_id)
# create_table("Store", 75,
#              ["store_id", "employee_id", "address"],
#              ["store_id"],
#              ["employee_id"],
#              [])
# # Customer  (AK: email, phone_number)
# create_table("Customer", 50000,
#              ["customer_id", "f_name", "l_name", "phone_number", "birthday", "gender", "email"],
#              ["customer_id", "email", "phone_number"],
#              [],
#              [])
# # Warehouse
# create_table("Warehouse", 12,
#              ["warehouse_id", "address", "sqft", "capacity"],
#              ["warehouse_id"],
#              [],
#              [])
# # Supplier  (AK: email)
# create_table("Supplier", 250,
#              ["supplier_id", "supplier_name", "address", "phone", "email"],
#              ["supplier_id", "email"],
#              [],
#              [])
# # Product  (FK -> Warehouse.warehouse_id, Supplier.supplier_id)
# create_table("Product", 20000,
#              ["product_id", "product_name", "brand", "category", "discount", "pricing", "warehouse_id", "supplier_id"],
#              ["product_id"],
#              ["warehouse_id", "supplier_id"],
#              [])
# # Shipment  (FK -> Store.store_id, Supplier.supplier_id)
# create_table("Shipment", 6000,
#              ["shipment_id", "store_id", "supplier_id", "order_date", "arrival_date", "numpallet", "cost"],
#              ["shipment_id"],
#              ["store_id", "supplier_id"],
#              [])
# # ProductShipment (junction)  PK: (shipment_id, product_id)  FK -> Shipment, Product
# create_table("ProductShipment", 50000,
#              ["shipment_id", "product_id"],
#              ["shipment_id", "product_id"],    # composite primary key
#              ["shipment_id", "product_id"],
#              [])
# # Advertisement  (FK -> Product.product_id)
# create_table("Advertisement", 1500,
#              ["ad_id", "ad_name", "channel", "budget", "product_id", "start_date", "end_date"],
#              ["ad_id"],
#              ["product_id"],
#              [])
# # Sale  (FK -> Customer, Employee, Product, Store)
# create_table("Sale", 120000,
#              ["sale_id", "order_type", "customer_id", "employee_id", "product_id", "store_id", "day", "month", "year"],
#              ["sale_id"],
#              ["customer_id", "employee_id", "product_id", "store_id"],
#              [])
#
