---
title: CodeSnippet Markdown Builder
tags: []
id: '48265'
categories:
  - - uncategorized
date: 2022-04-25 17:59:12
---

# Markdown Builder

## Source

```java
    public static class MarkdownBuilder {

        public static String buildMatrix(Object origin, Object[] rows, Object[] cols, Object[][] data) {

            /* Default value */
            if (origin == null) {
                origin = "";
            }

            if (rows == null) {
                rows = new String[data.length];
                for (int i = 0; i < data.length; i++) {
                    rows[i] = String.valueOf(i);
                }
            }

            if (cols == null) {
                cols = new String[data[0].length];
                for (int i = 0; i < data[0].length; i++) {
                    cols[i] = String.valueOf(i);
                }
            }

            /* Construct */
            StringBuilder result = new StringBuilder();
            result.append("\\begin{bmatrix}\n");
            for (int i = 0; i < data.length; i++) {
                // first row
                if (i == 0) {
                    for (int j = 0; j < cols.length; j++) {
                        // origin cell
                        if (j == 0) {
                            result.append(origin);
                            continue;
                        }
                        result.append("&").append(cols[j]);
                    }
                    result.append("\\\\\n");
                    continue;
                }
                // first column
                for (int j = 0; j < data[i].length; j++) {
                    if (j == 0) {
                        result.append(rows[i]);
                        continue;
                    }
                    result.append("&").append(data[i][j]);
                }
                result.append("\\\\").append("\n");
            }

            result.append("\\end{bmatrix}\n");
            return result.toString();
        }

        public static String buildTable(Object origin, Object[] rows, Object[] cols, Object[][] data) {

            /* Default value */
            if (origin == null) {
                origin = "";
            }

            if (rows == null) {
                rows = new String[data.length];
                for (int i = 0; i < data.length; i++) {
                    rows[i] = String.valueOf(i);
                }
            }

            if (cols == null) {
                cols = new String[data[0].length];
                for (int i = 0; i < data[0].length; i++) {
                    cols[i] = String.valueOf(i);
                }
            }

            /* Construct */
            StringBuilder result = new StringBuilder().append("\n");
            for (int i = 0; i < data.length; i++) {
                // first row
                if (i == 0) {
                    for (int j = 0; j < cols.length; j++) {
                        // origin cell
                        if (j == 0) {
                            result.append("").append(origin).append("");
                            continue;
                        }
                        result.append(cols[j]).append("");
                    }
                    result.append("\n");

                    // second row -> table properties
                    for (int j = 0; j < cols.length; j++) {
                        result.append(" :-: ");
                    }
                    result.append("").append("\n");
                }

                for (int j = 0; j < data[i].length; j++) {
                    // first column
                    if (j == 0) {
                        result.append("").append(rows[i]).append("");
                    }
                    result.append(data[i][j]).append("");
                }
                result.append("\n");
            }
            return result.append("\n").toString();
        }
    }

```

## Usage

### Demo

```java
    @Test
    void markdownBuilder() {
        String origin = "item\\property";
        String[] rows = {"item1", "item2", "item3"};
        String[] cols = {"value", "weight"};

        String[][] data = {
                {"value1", "weight1"},
                {"value2", "weight2"},
                {"value3", "weight3"}
        };

        System.out.println(Judger.MarkdownBuilder.buildMatrix(origin, rows, cols, data));
    }
```

### Preview

item\\property

value

weight

item1

value1

weight1

item2

value2

weight2

item3

value3

weight3