# Festival Management Database

A database for organising festivals: where they happen, what each place can supply, and who works at them.

## Language

**Festival**:
One event, held at one location for a set number of days.

**Location**:
A venue that can host festivals, with an address.
_Avoid_: venue (in prose), site, place

**Provision**:
Something a location can supply, like stages, toilets or catering, with a price and a quantity. Stored as `location_provision`.
_Avoid_: resource, facility, supply

**Allocation**:
Part of a location's provision set aside for one festival. Stored as `festival_provision`.
_Avoid_: booking, festival provision (in prose)

**Festival staff**:
A person hired to work at a festival, with a salary and contact details.
_Avoid_: employee, worker
