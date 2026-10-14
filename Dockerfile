FROM python:3.12-alpine

WORKDIR /app

# Security: Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy code with non-root ownership
COPY --chown=appuser:appgroup app.py .

# Switch to non-root user
USER appuser

CMD ["python", "app.py"]