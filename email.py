from fastapi import FastAPI, HTTPException
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

app = FastAPI()

# Email configuration
email_config = {
    "smtp_server": "your_smtp_server.com",  # Replace with your SMTP server
    "smtp_port": 587,  # Replace with the SMTP port
    "smtp_username": "your_username",  # Replace with your SMTP username
    "smtp_password": "your_password",  # Replace with your SMTP password
    "from_email": "your_email@example.com",  # Replace with your email address
}

@app.post("/send-email")
async def send_email(to_email: str, subject: str, message: str):
    try:
        # Create a connection to the SMTP server
        server = smtplib.SMTP(email_config["smtp_server"], email_config["smtp_port"])
        server.starttls()
        server.login(email_config["smtp_username"], email_config["smtp_password"])

        # Create the email message
        msg = MIMEMultipart()
        msg["From"] = email_config["from_email"]
        msg["To"] = to_email
        msg["Subject"] = subject

        # Attach the email message body
        msg.attach(MIMEText(message, "plain"))

        # Send the email
        server.sendmail(email_config["from_email"], to_email, msg.as_string())

        # Close the SMTP server connection
        server.quit()

        return {"message": "Email sent successfully"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to send email: {str(e)}")
