# Entra ID IAM Lab

Hands-on Microsoft Entra ID lab supporting my SC-300 (Identity and Access Administrator) prep.
Tenant: free-tier lab directory. All users are fictional test accounts.

## Week 1: Users, groups, roles, tenant basics
- Security defaults enabled; MFA enforced on admin account
- $1 Azure budget alert configured
- <N> test users created (e.g., alex.it, ...)
- 3 security groups: <Group 1>, <Group 2>, <Group 3>

## Role inventory

### Entra ID directory roles
| User | Group | Entra role | Scope | Why (least privilege) |
|---|---|---|---|---|
| alex.it | <IT group> | User Administrator | Tenant | Creates/edits users, can't change admin roles |
| <helpdesk user> | <Helpdesk group> | Helpdesk Administrator | Tenant | Password resets for non-admins only |
| <other user> | <Group> | None | n/a | Standard user, no admin needed |

### Azure RBAC roles
| User | Azure role | Scope | Why |
|---|---|---|---|
| <reviewer user> | Reader | Subscription | View-only access to resources |

## Design notes
- Only one Global Administrator (me); no test user holds Global Admin.
- Entra roles assigned directly to users: role-assignable groups need Entra ID P1.
- Planned: break-glass account (cloud-only, FIDO2, excluded from Conditional Access) once on P1.
- Planned: scope admin roles to administrative units (needs P1).

## Screenshots
![Users](screenshots/users.png)

## What I learned
<2-3 sentences in your own words: e.g., difference between Entra roles and Azure RBAC>
