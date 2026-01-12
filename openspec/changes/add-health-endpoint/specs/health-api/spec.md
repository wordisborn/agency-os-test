# Spec: Health API

**Capability:** `health-api`
**Change:** `add-health-endpoint`

## Overview

This spec defines a health check endpoint that allows monitoring systems, load balancers, and operators to verify the application is running and responding to requests.

---

## ADDED Requirements

### Requirement: Health Endpoint Availability

The application MUST provide a publicly accessible health check endpoint.

#### Scenario: Monitoring system checks application health

**Given** the application is running
**When** a monitoring system sends a GET request to `/api/health`
**Then** the endpoint responds with HTTP 200 OK
**And** the response includes a JSON body
**And** the response time is under 100ms

#### Scenario: Load balancer performs health check

**Given** the application is deployed behind a load balancer
**When** the load balancer sends a GET request to `/api/health`
**Then** the endpoint responds with HTTP 200 OK within 100ms
**And** no authentication or API keys are required
**And** the load balancer marks the application as healthy

---

### Requirement: Health Response Format

The health endpoint MUST return a consistent JSON response format.

#### Scenario: Successful health check returns status

**Given** the application is running normally
**When** a client sends GET request to `/api/health`
**Then** the response has HTTP status 200
**And** the response Content-Type is `application/json`
**And** the response body contains a `status` field with value `"ok"`
**And** the response body contains a `timestamp` field with ISO 8601 format

#### Scenario: Response includes current timestamp

**Given** the application receives a health check request
**When** the endpoint processes the request
**Then** the response timestamp reflects the current server time
**And** the timestamp is in ISO 8601 format (e.g., "2026-01-12T12:34:56.789Z")

---

### Requirement: No Authentication Required

The health endpoint MUST be accessible without authentication.

#### Scenario: Unauthenticated request succeeds

**Given** a client has no API keys or authentication tokens
**When** the client sends GET request to `/api/health`
**Then** the endpoint responds with HTTP 200 OK
**And** the response includes the health status
**And** no authentication errors occur

---

### Requirement: Consistent Availability

The health endpoint MUST be available in all deployment environments.

#### Scenario: Health check works in development

**Given** the application is running in development mode (`npm run dev`)
**When** a request is sent to `http://localhost:3000/api/health`
**Then** the endpoint responds with HTTP 200
**And** the response format is correct

#### Scenario: Health check works in production

**Given** the application is built and running in production mode
**When** a request is sent to `/api/health`
**Then** the endpoint responds with HTTP 200
**And** the response format matches the specification
**And** the response time is under 100ms

#### Scenario: Health check works on Vercel

**Given** the application is deployed to Vercel
**When** a request is sent to `https://<app-url>/api/health`
**Then** the endpoint responds with HTTP 200
**And** the response includes correct JSON
**And** Vercel logs show no errors

---

### Requirement: Minimal Response Caching

The health endpoint MUST include cache control headers to prevent stale responses.

#### Scenario: Response includes no-cache headers

**Given** a client requests the health endpoint
**When** the server responds
**Then** the response includes `Cache-Control: no-cache, no-store, must-revalidate` header
**And** monitoring systems always receive current health status

---

## Implementation Notes

- Use Next.js App Router API route: `/app/api/health/route.ts`
- Export a `GET` function that returns a `Response` object
- Use `new Date().toISOString()` for timestamp
- Set Content-Type to `application/json`
- Return HTTP 200 status code

## Related Capabilities

None. This is the first API endpoint in the system.

## Acceptance Criteria

All scenarios in this spec must pass for the change to be considered complete.

## Future Enhancements (Out of Scope)

- Add dependency health checks (database connectivity, external API status)
- Include version information in response
- Add detailed system metrics (memory usage, uptime)
- Implement rate limiting
- Add authentication for detailed health information
