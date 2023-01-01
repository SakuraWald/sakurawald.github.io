---
title: CodeSnippet - A Simple Judger for Java
tags: []
id: '35506'
categories:
  - - uncategorized
date: 2022-04-05 22:22:32
---

# A Simple Judger for Java

一个简单判题机，基于Java语言，于Windows或Linux平台，为了本地测试。

## Function List

*   易于使用的接口设计
    
*   规格化的信息格式
    
*   链式配置函数
    
*   输入/输出文件模糊扫描
    
*   支持ForEach的迭代器模式
    
*   自动案例计时
    
*   自动重定向IO
    
*   自动异常捕获
    
*   设置单案例运行时间限制
    
*   全局判题结果统计
    
*   可选的手动计时器控制
    
*   可选的忽略输入和输出
    
*   可选的输入输出行数限制
    
*   可自定义的错误流文件
    
*   输出Judger调试信息
    
*   跳过特定案例
    
*   忽略/不忽略特定案例
    
*   延迟初始化
    
*   优雅退出
    
*   内建输出函数
    
*   安全运行块
    

## Source

```java
package util;

import java.awt.*;
import java.io.*;
import java.net.URI;
import java.nio.file.Files;
import java.util.List;
import java.util.Queue;
import java.util.*;
import java.util.stream.Stream;

/**
 * @author Teeth
 * @date 3/5/2022 07:16
 * A simple judger to read in the input and output files and compare them.
 */
@SuppressWarnings({"UnusedReturnValue", "SpellCheckingInspection"})
public class Judger implements Iterable<Scanner>, Iterator<Scanner> {


    /* Pair Define */
    @SuppressWarnings("unused")
    public static class Pair<K, V> {
        public K key;
        public V value;

        public Pair(K key, V value) {
            this.key = key;
            this.value = value;
        }

        public K getKey() {
            return key;
        }

        public V getValue() {
            return value;
        }

        public void setKey(K key) {
            this.key = key;
        }

        public void setValue(V value) {
            this.value = value;
        }
    }

    /* Special Flags */
    private static final String ignoreCaseFileNamePrefix = "_";
    private static final int defaultEndTimestamp = 0xdead;

    /* Redirect System.out */
    private PrintStream tempOutPrintStream;
    private File tempOutFile;
    private Pair<File, File> currentCase;

    /* Case Queue */
    private boolean judgerInitialized = false;
    private final File inDirectory;
    private final File outDirectory;
    private final Queue<Pair<File, File>> caseQueue = new LinkedList<>();

    /* Judger Flags */
    private final ArrayList<String> joinCaseFileKeywords = new ArrayList<>();
    private final ArrayList<String> ignoreExceptCaseFileKeywords = new ArrayList<>();
    private final ArrayList<String> ignoreCaseFileKeywords = new ArrayList<>();
    private boolean skipCurrentCaseFlag = false;
    private long timeLimitMS = Long.MAX_VALUE;
    private boolean hideInputAndOutputFlag = false;
    private boolean prettyFormat = false;
    private int maxExpectInputLines = 0xbadc0de;
    private int maxExpectOutputLines = 0xbadc0de;
    private int maxYourOutputLines = 0xbadc0de;
    private boolean debugPrintFunctions = true;

    /* Statistics */
    private StringBuilder resultStatistics = new StringBuilder();
    private long startTimestamp;
    private long endTimestamp;

    /* Use this constructor if you don't know how to fill the paths */
    public Judger(File inDirectory, File outDirectory) {
        this.inDirectory = inDirectory;
        this.outDirectory = outDirectory;
    }

    /* It's recommended to use this constructor. */
    public Judger(String casePath) {
        this(".", casePath);
    }

    public Judger(String basePath, String casePath) {
        this(basePath, casePath, "TEST", "ANSWER");
    }

    public Judger(String basePath, String casePath, String inDirectoryName, String outDirectoryName) {
        this.inDirectory = new File(basePath + File.separator + casePath + File.separator + inDirectoryName);
        this.outDirectory = new File(basePath + File.separator + casePath + File.separator + outDirectoryName);
    }

    private String getInPath() {
        return this.inDirectory.getAbsolutePath();
    }

    private String getOutPath() {
        return this.outDirectory.getAbsolutePath();
    }

    private void initJudger() {
        /* Init the exception handler */
        registerJudgerUncaughtExceptionHandler();

        /* Init file queue */
        initFileQueue();
    }

    private void initFileQueue() {
        try {
            for (File file : new File(this.getInPath()).listFiles()) {
                String entryName = file.getName();

                /* Ignore Cases */
                // Ignore Case File-Name-Prefix
                if (entryName.startsWith(ignoreCaseFileNamePrefix) && this.joinCaseFileKeywords.stream().noneMatch(entryName::contains)) {
                    continue;
                }

                // Ignore Case File-Name-Keywords
                if (this.ignoreExceptCaseFileKeywords.size() > 0) {
                    if (this.ignoreExceptCaseFileKeywords.stream().noneMatch(entryName::contains) && this.joinCaseFileKeywords.stream().noneMatch(entryName::contains)) {
                        continue;
                    }
                }

                if (this.ignoreCaseFileKeywords.stream().anyMatch(entryName::contains) && this.joinCaseFileKeywords.stream().noneMatch(entryName::contains))
                    continue;

                entryName = entryName.substring(0, entryName.lastIndexOf("."));

                File inEntity = new File(this.getInPath() + File.separator + entryName + ".in");
                File outEntity = new File(this.getOutPath() + File.separator + entryName + ".out");
                Pair<File, File> pair = new Pair<>(inEntity, outEntity);
                this.caseQueue.add(pair);
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.displayDebugInfo();
        }
    }

    private Scanner redirectInput(Pair<File, File> pair) {
        try {
            return new Scanner(pair.getKey());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    private void redirectOutput() {
        try {
            this.tempOutFile = File.createTempFile("temp", ".out");
            this.tempOutPrintStream = new PrintStream(new FileOutputStream(this.tempOutFile));
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.setOut(this.tempOutPrintStream);
    }

    public Judger redirectError(String file) {
        return this.redirectError(new File(file));
    }

    public Judger redirectError(File file) {
        try {
            System.setErr(new PrintStream(new FileOutputStream(file)));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return this;
    }

    /* This method assumes that the in-case and out-case have the same parent directory,
     *  and will write error file to the parent direcotry.
     *  */
    public Judger redirectError() {
        /* Get main() java file name */
        StackTraceElement[] stackTrace = new Exception().getStackTrace();
        String runningJavaFileName = stackTrace[stackTrace.length - 1].getFileName();

        /* Redirect */
        String errorFileName = runningJavaFileName + ".error";
        this.redirectError(new File(this.inDirectory.getParent() + File.separator + errorFileName));
        return this;
    }

    private void displayExpectationIO(Pair<File, File> pair) {
        System.err.println("Current Case: " + pair.getKey().getName() + " & " + pair.getValue().getName());

        /* Display Expectation IO */
        if (this.hideInputAndOutputFlag) return;
        try {
            List<String> expectInput = Files.readAllLines(pair.getKey().toPath());
            List<String> expectOutput = Files.readAllLines(pair.getValue().toPath());

            // Limit Expect Input/Output
            if (this.maxExpectInputLines < expectInput.size()) {
                int omit = expectInput.size() - this.maxExpectInputLines;
                expectInput = expectInput.subList(0, this.maxExpectInputLines);
                this.addLimitedMessage(expectInput, omit);
            }
            if (this.maxYourOutputLines < expectOutput.size()) {
                int omit = expectOutput.size() - this.maxExpectOutputLines;
                expectOutput = expectOutput.subList(0, this.maxExpectOutputLines);
                this.addLimitedMessage(expectOutput, omit);
            }

            System.err.println("Expected  Input: " + expectInput);
            System.err.println("Expected Output: " + expectOutput);
            // Flush to make sure the message is displayed
            System.err.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displaySeparator() {
        System.err.println("-----------------------------------------------------");
    }

    private void displayStatistics() {
        this.displaySeparator();
        System.err.println("Result Statistics: " + this.resultStatistics);
    }

    private long displayTimeCost() {
        // If the timer didn't be stopped manually, stop it.
        if (this.endTimestamp == defaultEndTimestamp) {
            this.manuallyStopTimer();
        }

        // Calc the time cost.
        long timeCost = this.endTimestamp - this.startTimestamp;
        System.err.printf("Time Cost: %f ms (%d ns)%n", timeCost / 1E6, timeCost);
        return timeCost;
    }

    @Override
    public Iterator<Scanner> iterator() {
        return this;
    }

    @Override
    public boolean hasNext() {

        /* Delay the initialization of judger */
        if (!this.judgerInitialized) {
            this.initJudger();
            this.judgerInitialized = true;
            // Special case: if no case files are valid (the case directory is empty or the case is filtered).
            if (this.caseQueue.isEmpty()) {
                System.err.println("No case files are valid.");
                System.err.println("1. The case directory is empty.");
                System.err.println("2. The case is filtered.");
                return false;
            }
        }

        /* All the cases processed ? */
        if (this.caseQueue.isEmpty()) {
            // Judge the last case.
            this.judgeCase();

            // Output the statistics.
            this.displayStatistics();
            return false;
        }
        return true;
    }

    @Override
    public Scanner next() {
        /* No more cases ? */
        if (this.caseQueue.isEmpty()) throw new IllegalStateException("No more cases.");

        /* Judge previous case ? */
        if (this.currentCase != null) {
            // Judge the previous case.
            this.judgeCase();
        }

        /* Get a new case */
        Pair<File, File> aCase = this.currentCase = this.caseQueue.poll();
        this.displaySeparator();
        this.displayExpectationIO(aCase);
        this.redirectOutput();
        Scanner scanner = this.redirectInput(aCase);

        /* Start the timer */
        this.manuallyStartTimer();
        return scanner;
    }

    public Pair<File, File> getCurrentCase() {
        return this.currentCase;
    }

    public String getCurrentCaseName() {
        return this.currentCase.getKey().getName();
    }

    /**
     * Call this function if you want to reset the timer.
     */
    public void manuallyStartTimer() {
        this.startTimestamp = System.nanoTime();
        this.endTimestamp = defaultEndTimestamp;
    }

    public void manuallyStopTimer() {
        this.endTimestamp = System.nanoTime();
    }

    public Judger displayDebugInfo() {
        this.displaySeparator();
        System.err.println("● Java Program Run Path = " + new File(".").getAbsolutePath());
        try {
            System.err.println("☆ InPath = " + this.getInPath());
            System.err.println("☆ InPath (Absolute) = " + new File(this.getInPath()).getAbsolutePath());
            System.err.println("★ InPath (Canonical) = " + new File(this.getInPath()).getCanonicalPath());
            System.err.println("☆ OutPath = " + this.getOutPath());
            System.err.println("☆ OutPath (Absolute) = " + new File(this.getOutPath()).getAbsolutePath());
            System.err.println("★ OutPath (Canonical) = " + new File(this.getOutPath()).getCanonicalPath());
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.displaySeparator();
        return this;
    }


    public Judger hideInputAndOutput() {
        this.hideInputAndOutputFlag = true;
        return this;
    }

    public Judger setTimeLimitMS(long timeLimitMS) {
        this.timeLimitMS = timeLimitMS;
        return this;
    }

    public Judger setMaxExpectedInputLines(int limit) {
        this.maxExpectInputLines = limit;
        return this;
    }

    public Judger setMaxExpectedOutputLines(int limit) {
        this.maxExpectOutputLines = limit;
        return this;
    }

    public Judger setMaxYourOutputLines(int limit) {
        this.maxYourOutputLines = limit;
        return this;
    }

    public Judger enablePrettyFormat() {
        this.prettyFormat = true;
        return this;
    }

    public Judger disablePrettyFormat() {
        this.prettyFormat = false;
        return this;
    }

    public Judger enableDebugPrintFunctions() {
        this.debugPrintFunctions = true;
        return this;
    }

    public Judger disableDebugPrintFunctions() {
        this.debugPrintFunctions = false;
        return this;
    }

    private void addLimitedMessage(List<String> list, int omit) {
        list.add(String.format("Omit the remaining %d line(s)...", omit));
    }

    private String prettyFormat(List<String> list) {
        StringBuilder sb = new StringBuilder("\n");
        sb.append("[SOF]");
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
            if (i == list.size() - 1) {
                sb.append("[EOF]");
            } else sb.append("\n");
        }
        // Special case: empty list
        if (list.isEmpty()) sb.append("[EOF]");
        return sb.toString();
    }

    private String formatList(List<String> list) {
        if (this.prettyFormat) {
            return this.prettyFormat(list);
        } else return list.toString();
    }

    /* Judger will set a skip flag, but you should manually skip your algorithm steps. */
    public Judger skipCurrentCase() {
        this.skipCurrentCaseFlag = true;
        return this;
    }

    public Judger ignoreExceptCase(String keywords) {
        this.ignoreExceptCaseFileKeywords.add(keywords);
        return this;
    }

    public Judger ignoreCase(String keywords) {
        this.ignoreCaseFileKeywords.add(keywords);
        return this;
    }

    /* Join a case and guarantee the case will be added into cases queue */
    public Judger joinCase(String keywords) {
        this.joinCaseFileKeywords.add(keywords);
        return this;
    }

    @SuppressWarnings("UnusedAssignment")
    private void judgeCase() {

        /* Read from the temp out file */
        List<String> tempOutFileContent = null;
        try {
            tempOutFileContent = Files.readAllLines(this.tempOutFile.toPath());
            if (!this.hideInputAndOutputFlag) {

                if (this.maxYourOutputLines < tempOutFileContent.size()) {
                    int omit = tempOutFileContent.size() - this.maxYourOutputLines;
                    tempOutFileContent = tempOutFileContent.subList(0, this.maxYourOutputLines);
                    this.addLimitedMessage(tempOutFileContent, omit);
                }

                System.err.println("Your     Output: " + formatList(tempOutFileContent));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        /* End the timer. */
        // it's better to stop the timer earlier, but it's not necessary.
        long timeCost = 0;
        if (!this.skipCurrentCaseFlag) {
            timeCost = this.displayTimeCost();
        }

        /* Judge Result Type */
        List<String> expectedOutFileContent;
        try {
            /* Handle Judger Flags */
            if (this.skipCurrentCaseFlag) {
                this.skipCurrentCaseFlag = false;
                this.resultStatistics.append("→ ");
                System.err.println("Skipped.");
                return;
            }

            /* Compare the texts */
            expectedOutFileContent = Files.readAllLines(this.currentCase.getValue().toPath());
            boolean accepted = true;
            String message = "Accepted";
            String symbol = "√";

            // Your Output == Expect Output ?
            if (!Boolean.logicalAnd(accepted, tempOutFileContent.toString().equals(expectedOutFileContent.toString()))) {
                accepted = false;
                message = "Wrong Answer.";
                symbol = "×";
            }
            // Time Limit Exceed ?
            else if (!Boolean.logicalAnd(accepted, (timeCost / 1E6) <= this.timeLimitMS)) {
                accepted = false;
                message = "Time Limit Exceed.";
                symbol = "▲";
            }

            this.resultStatistics.append(symbol).append(" ");
            System.err.println(message);
        } catch (IOException e) {
            e.printStackTrace();
            this.resultStatistics.append("? ");
            System.err.println("Unexpected Error !");
        }
    }

    public void gracefullyExit(boolean closeStreams, boolean exit) {
        System.err.println("===== Begin gracefully exit =====");

        /* Judge case before exit */
        this.judgeCase();

        /* Flush and close the System.in stream. */
        // Nobody cares the input stream.

        /* Flush and close the System.out stream. */
        System.out.flush();
        if (closeStreams) {
            System.out.close();
        }

        /* Flush and close the System.err stream. */
        System.err.println("===== End gracefully Exit. =====");
        System.err.flush();
        if (closeStreams) {
            System.err.close();
        }

        /* Exit the JVM */
        if (exit) {
            System.exit(0);
        }
    }

    private void setThreadUncaughtExceptionHandler(Thread thread) {
        thread.setUncaughtExceptionHandler((t, e) -> {
            /* Handle the exception. */
            this.displayThrowable(t, e);

            /* Gracefully exit. */
            gracefullyExit(true, true);
        });
    }

    private void displayThrowable(Thread t, Throwable e) {
        System.err.println("===== Exception Occurred. =====");
        System.err.println("Current Thread: " + t);
        e.printStackTrace();
        System.err.println("\n");
    }

    private void registerJudgerUncaughtExceptionHandler() {
        this.setThreadUncaughtExceptionHandler(Thread.currentThread());
    }

    public Judger println(Object object) {
        if (this.debugPrintFunctions) {
            System.out.println(object);
        }
        return this;
    }

    public Judger print(Object object) {
        if (this.debugPrintFunctions) {
            System.out.print(object);
        }
        return this;
    }

    public Judger printf(String format, Object... args) {
        if (this.debugPrintFunctions) {
            System.out.printf(format, args);
        }
        return this;
    }

    public Judger safeRun(Runnable runnable) {
        try {
            runnable.run();
        } catch (Exception e) {
            /* Display Throwable */
            this.displayThrowable(Thread.currentThread(), e);

            /* Handle Throwable */
            // Store judger context
            StringBuilder $resultStatistics = this.resultStatistics;
            this.resultStatistics = new StringBuilder();
            // Gracefully exit (but don't exit the JVM)
            this.gracefullyExit(false, false);
            // Load judger context
            this.resultStatistics = $resultStatistics;
        }
        return this;
    }

    public abstract static class MermaidBuilder {

        public final Style style = new Style(this);
        public final Counter counter = new Counter();
        private ArrayList<String> mermaidStatements;

        public MermaidBuilder() {
            this.reset();
        }

        public abstract void preStatement();

        public abstract void postStatement();

        public void uniqueStatement() {
            HashSet<String> visited = new HashSet<>();
            ArrayList<String> result = new ArrayList<>();
            for (String statement : this.mermaidStatements) {
                if (!visited.contains(statement)) {
                    visited.add(statement);
                    result.add(statement);
                }
            }
            this.mermaidStatements = result;
        }

        public void reset() {
            this.mermaidStatements = new ArrayList<>();
            this.preStatement();
        }

        public String build() {
            /* PostStatement */
            this.postStatement();

            /* Build Mermaid String */
            StringBuilder mermaidStringBuilder = new StringBuilder();
            for (String mermaidStatement : this.mermaidStatements) {
                mermaidStringBuilder.append(mermaidStatement).append("\n");
            }
            return mermaidStringBuilder.toString();
        }

        protected abstract Stream<String> parseNode(Object... args);

        public void addStatement(String statement) {
            this.mermaidStatements.add(statement);
        }

        public void addNode(Object... args) {
            Optional.ofNullable(this.parseNode(args)).ifPresent(o -> o.forEach(statement -> {
                if (statement != null) {
                    this.addStatement(statement);
                }
            }));
        }

        public void print() {
            System.out.println();
            System.out.println("===== Begin Mermaid Statements =====");
            System.out.println(this.build());
            System.out.println("===== End Mermaid Statements =====");
        }

        public void image() {
            String base64 = new String(Base64.getEncoder().encode(this.build().getBytes()));
            String URL = "https://mermaid.ink/img/" + base64;
            try {
                Desktop.getDesktop().browse(new URI(URL));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        public String ofID(Object... args) {
            StringBuilder id = new StringBuilder();
            for (int i = 0; i < args.length; i++) {
                id.append(args[i]);
                if (i != args.length - 1) {
                    id.append("#");
                }
            }
            return id.toString();
        }

        public String uuid() {
            return UUID.randomUUID().toString().substring(0, 8);
        }

        public static class Style {
            private final MermaidBuilder builder;

            public Style(MermaidBuilder builder) {
                this.builder = builder;
            }

            public void stress(String nodeID, String color) {
                builder.addStatement(String.format("style %s fill: %s,stroke: #333,stroke-width: 4px", nodeID, color));
            }

            public void css(String nodeID, String css) {
                builder.addStatement(String.format("style %s %s", nodeID, css));
            }
        }

        public static class Counter {
            private int counter;

            public Counter() {
                this.reset();
            }

            public void reset() {
                this.counter = 0;
            }

            public int increment(int delta) {
                return this.counter += delta;
            }

            public int increment() {
                return this.increment(+1);
            }

            public int get() {
                return counter;
            }

            public void set(int value) {
                this.counter = value;
            }
        }

    }

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

}

```

## Usage

#### Simple Demo

```java
    public static Judger judger = new Judger("/Cases/Two's Sum");
    public static void main(String[] args) {
        for (Scanner scanner : judger) {
            int a = scanner.nextInt();
            int b = scanner.nextInt();
            int sum = a + b;
            System.out.println(sum);
        }
    }
```

#### Advanced Demo

```java
    public static Judger judger = new Judger("/Cases/Two's Sum")
        .redirectError()
        .enablePrettyFormat()
        .ignoreExceptCase("CASES")
        .ignoreCase("CASE5")
        .joinCase("CASE3")
        .setMaxExpectedInputLines(1)
        .setTimeLimitMS(1000);

    public static void main(String[] args) {
        for (Scanner scanner : judger) {
            int a = scanner.nextInt();
            int b = scanner.nextInt();
            int sum = a + b;
            System.out.println(sum);
        }
    }
```

> 解释：让 `Judger` 从 `"/Cases/Lab5/COIN CHANGING"` 路径下 `扫描` 所有的 `案例文件`，然后 `重定向错误`到合适的路径，并且期望启用 `自由格式输出`，还需要设置 `期望输出的最大显示限制`，此外，每个案例的 `运行时间`限定为 1000ms。
> 
> 所有 `被扫描到且有效的案例文件` 将被创建为 `Scanner实例序列`，通过 `foreach语法糖`即可获得所有的 `案例实例`