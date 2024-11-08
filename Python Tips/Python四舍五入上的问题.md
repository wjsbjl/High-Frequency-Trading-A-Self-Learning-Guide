```python
from decimal import Decimal
def accurate_round(n:float, round_to:int=0)-> float:
	float(Decimal(str(n)).quantize(Decimal(f"{10 ** -round_to}"), rounding="ROUND_HALF_UP"))
```