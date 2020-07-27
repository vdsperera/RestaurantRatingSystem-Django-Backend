from enum import Enum

class ClaimStatus(Enum):
    Unclaimed = 0
    Pending = 1
    Claimed = 2
    