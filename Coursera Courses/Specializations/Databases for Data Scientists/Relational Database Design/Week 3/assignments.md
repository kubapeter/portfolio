# Question 1: Normal Forms

> "1A: What normal form is the following relation in (key is underlined), and Why? Make sure you provide both Answer and Reasoning:
>
> STORE_ITEM (SKU, EventID, Vendor, Style, Price, Warranty)
>- FD1: SKU, EventID → Vendor, Style, Price
>- FD2: SKU → Vendor, Style, Warranty
>- FD3: Vendor → Warranty
>
> 1B: What normal form is the following relation in (key is underlined), and Why? Make sure you provide both Answer and Reasoning:
>
> SKU (SKU, Vendor, Style, Warranty)
>- FD1: SKU → Vendor, Style, Warranty
>- FD2: Vendor → Warranty
>
> 1C: What normal form is the following relation in (key is underlined), and Why? Make sure you provide both Answer and Reasoning:
>
> SKU (SKU, Vendor, Style, Warranty)
>- FD1: SKU → Vendor, Style, Warranty
>- FD2: Vendor, Style → Warranty"

### 1A:
- It is in 1NF because it is a relation.
- It is not in 2NF because there is a partial FD: FD2: SKU → Vendor, Style, Warranty and SKU is part of the key (SKU, EventID)

### 1B:
- It is in 1NF because it is a relation.
- It is in 2NF because there is no partial FD.
- It is not in 3NF because there is a transitive FD: SKU → Vendor and Vendor → Warranty.

### 1C:
- It is in 1NF because it is a relation.
- It is in 2NF because there is no partial FD.
- It is not in 3NF because there is a transitive SKU → Vendor, Style  and Vendor, Style → Warranty.
