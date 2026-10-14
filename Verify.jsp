<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.regex.Pattern" %>

    <% request.setCharacterEncoding("UTF-8"); String name=request.getParameter("name"); String
      email=request.getParameter("email"); String summary=request.getParameter("summary"); if (name==null) name="" ; if
      (email==null) email="" ; if (summary==null) summary="" ; String trimmedSummary=summary.trim(); int
      words=trimmedSummary.isEmpty() ? 0 : trimmedSummary.split("\\s+").length; String
      lowerSummary=trimmedSummary.toLowerCase(); String[] keywords={ "hibernate" , "orm" , "java" , "database"
      , "session" , "object" , "sql" , "mapping" }; int mistakes=0; for (String keyword : keywords) { if
      (!lowerSummary.contains(keyword)) { mistakes++; } } int marks=Math.max(0, 10 - mistakes); String
      safeName=name.replace("&", "&amp;" ) .replace("<", "&lt;" ).replace(">", "&gt;")
      .replace("\"", "&quot;").replace("'", "&#39;");

      String safeEmail = email.replace("&", "&amp;")
      .replace("<", "&lt;" ).replace(">", "&gt;")
        .replace("\"", "&quot;").replace("'", "&#39;");

        String safeSummary = summary.replace("&", "&amp;")
        .replace("<", "&lt;" ).replace(">", "&gt;")
          .replace("\"", "&quot;").replace("'", "&#39;");
          %>

          <!DOCTYPE html>
          <html lang="en">

          <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Your Result</title>
            <style>
              body {
                max-width: 760px;
                margin: 40px auto;
                padding: 0 20px;
                color: #243044;
                font-family: Arial, sans-serif;
                line-height: 1.7;
                background: #f4f7fb;
              }

              h1 {
                color: #2458a6;
              }

              .card {
                padding: 28px;
                border-radius: 10px;
                background: white;
                box-shadow: 0 4px 14px #24304418;
              }

              .label {
                font-weight: bold;
                margin-bottom: 4px;
              }

              .value {
                margin-top: 0;
                overflow-wrap: anywhere;
              }

              .summary {
                padding: 12px;
                background: #f4f7fb;
                white-space: pre-wrap;
              }

              .marks {
                font-size: 1.25rem;
                font-weight: bold;
              }

              a {
                color: #2458a6;
              }
            </style>
          </head>

          <body>
            <h1>Your Result</h1>

            <main class="card">
              <p class="label">Name</p>
              <p class="value">
                <%= safeName %>
              </p>

              <p class="label">Email</p>
              <p class="value">
                <%= safeEmail %>
              </p>

              <p class="label">Summary written by the user</p>
              <p class="value summary">
                <%= safeSummary %>
              </p>

              <p class="label">Word count</p>
              <p class="value">
                <%= words %>
              </p>

              <p class="label">Mistakes</p>
              <p class="value">
                <%= mistakes %>
              </p>

              <p class="label">Marks</p>
              <p class="value marks">
                <%= marks %> / 10
              </p>

              <a href="About.html">Start Again</a>
            </main>
          </body>

          </html>